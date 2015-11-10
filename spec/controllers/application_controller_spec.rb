require 'rails_helper'

RSpec.describe ApplicationController do
  controller(ApplicationController) do
    def index
      render json: {'users' => []}.to_json
    end
  end

  before do
    @routes = ActionDispatch::Routing::RouteSet.new.tap do |r|
      r.draw { get 'index', to: 'anonymous#index' }
    end
  end

  context 'cannot make a request to the API' do
    it 'without an API token' do
      api_get :index, {}
      expect(response).to have_http_status(:unauthorized)
    end

    it 'with an invalid API Token' do
      request.headers['X-Tango-Api-Token'] = 'fake_token'
      api_get :index, {}
      expect(response).to have_http_status(:not_found)
    end
  end
end