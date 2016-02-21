require 'rails_helper'

RSpec.describe UsersController do
  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { {name: nil, email: nil} }
  let(:permitted_attributes) { [:name, :email, :integration_id, :integration_type, :birthday, :bio, :password, :password_confirmation] }
  let(:returned_attributes) { permitted_attributes.reject {|a| a.to_s.match /password/ } }
  let!(:user) {create(:user)}

  before do
    stub_authentication!
  end

  describe 'GET #index' do
    it 'assigns all users as @users' do
      api_get :index, {}

      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      api_get :show, {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #new' do
    it 'assigns a new user as @user' do
      api_get :new, {}
      expect(json_response[:permitted_attributes]).to eq(permitted_attributes.map(&:to_s))
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user as @user' do
      api_get :edit, {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do

      def do_action
        api_post :create, {user: valid_attributes}
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

        returned_attributes.each do |key|
          expect(json_response[:user][key]).to eq(valid_attributes[key])
        end
      end
    end

    context 'with invalid params' do
      before {
        api_post :create, {user: invalid_attributes}
      }

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
      let(:new_attributes) {
        valid_attributes
          .merge(name: 'Diego Domingues')
      }

      before {
        api_put :update, {id: user.to_param, user: new_attributes}
      }

      it 'updates the requested user' do
        expect(user.reload.name).to eq(new_attributes[:name])
      end

      it 'assigns the requested user as @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'renders the updated user' do
        returned_attributes.each do |key|
          expect(json_response[:user][key]).to eq(new_attributes[key])
        end
      end
    end

    context 'with invalid params' do
      before { api_put :update, {id: user.to_param, user: invalid_attributes} }

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
      api_delete :destroy, {id: user.to_param}
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
end
