require 'rails_helper'

RSpec.describe ApplicationController do
  controller(ApplicationController) do
    def index; end
  end

  context 'without an API token' do
    it 'returns an unauthorized status' do
      get :index

      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'with an invalid API Token' do
    before { request.headers['X-Tango-Api-Token'] = 'fake_token' }

    it 'returns a not_found status' do
      get :index

      expect(response).to have_http_status(:not_found)
    end
  end
end
