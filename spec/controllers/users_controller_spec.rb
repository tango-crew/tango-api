require 'rails_helper'

RSpec.describe UsersController do
  let(:valid_attributes) { attributes_for(:user).except(:token) }
  let(:invalid_attributes) { { name: nil, email: nil } }
  let(:returned_attributes) {
    [:id, :name, :email, :token, :integration_id,
     :integration_type, :birthday, :bio,
     :profile_image_id,
     :profile_image_filename,
     :profile_image_content_type,
     :profile_image_size]
  }
  let!(:user) { create(:user) }

  before { stub_authentication! }

  describe 'GET #index' do
    it 'assigns all users as @users' do
      get :index

      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      get :show, params: { id: user.to_param }

      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      def do_action
        post :create, params: { user: valid_attributes }
      end

      it 'creates a new User' do
        expect {
          do_action
        }.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        do_action

        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'renders the created user' do
        do_action

        expect(json_response[:name]).to eq(valid_attributes[:name])
        expect(json_response[:email]).to eq(valid_attributes[:email])
        expect(json_response[:integration_id]).to eq(valid_attributes[:integration_id])
        expect(json_response[:integration_type]).to eq(valid_attributes[:integration_type])
        expect(json_response[:birthday]).to eq(valid_attributes[:birthday])
        expect(json_response[:bio]).to eq(valid_attributes[:bio])
        expect(json_response).to include(*returned_attributes)
      end
    end

    context 'with invalid params' do
      before { post :create, params: { user: invalid_attributes } }

      it 'assigns a newly created but unsaved user as @user' do
        expect(assigns(:user)).to be_a_new(User)
      end

      it 'returns unprocessable_entity http status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders the validation errors' do
        expect(json_response.keys.map(&:to_sym)).to contain_exactly(:name, :email)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        valid_attributes
          .merge(name: 'Diego Domingues')
      end

      before { put :update, params: { id: user.to_param, user: new_attributes } }

      it 'updates the requested user' do
        expect(user.reload.name).to eq(new_attributes[:name])
      end

      it 'assigns the requested user as @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'renders the updated user' do
        expect(json_response[:name]).to eq(new_attributes[:name])
        expect(json_response[:email]).to eq(new_attributes[:email])
        expect(json_response[:integration_id]).to eq(new_attributes[:integration_id])
        expect(json_response[:integration_type]).to eq(new_attributes[:integration_type])
        expect(json_response[:birthday]).to eq(new_attributes[:birthday])
        expect(json_response[:bio]).to eq(new_attributes[:bio])
        expect(json_response).to include(*returned_attributes)
      end
    end

    context 'with invalid params' do
      before { put :update, params: { id: user.to_param, user: invalid_attributes } }

      it 'assigns the user as @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'returns unprocessable_entity http status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders the validation errors' do
        expect(json_response.keys.map(&:to_sym)).to contain_exactly(:name, :email)
      end
    end
  end

  describe 'DELETE #destroy' do
    def do_action
      delete :destroy, params: { id: user.to_param }
    end

    it 'destroys the requested user' do
      expect {
        do_action
      }.to change(User, :count).by(-1)
    end

    it 'renders not_content' do
      do_action

      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'POST #sign_in' do
    context 'when the params are correct' do
      let!(:user) { create(:user, email: 'u@g.com', password: '123456') }

      it 'returns the user' do
        allow(User).to receive(:authenticate!).with('u@g.com', '123456').and_return(user)

        post :sign_in, params: { user: { email: user.email, password: '123456' } }

        expect(json_response[:email]).to eq(user.email)
      end
    end

    context 'when the params are incorrect' do
      it 'returns the http status not_found' do
        allow(User).to receive(:authenticate!).with('u@g.com', '123456').and_raise(ActiveRecord::RecordNotFound)

        post :sign_in, params: { user: { email: 'u@g.com', password: '123456' } }

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
