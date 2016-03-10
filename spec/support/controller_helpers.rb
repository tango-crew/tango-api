module ControllerHelpers
  extend ActiveSupport::Concern

  def json_response
    case body = JSON.parse(response.body)
    when Hash
      body.with_indifferent_access
    when Array
      body
    end
  end

  def stub_authentication!
    request.headers['X-Tango-Api-Token'] = 'fake_token'
    allow(User).to receive(:find_by).with(hash_including(:token)) { current_user }
  end

  def current_user
    @current_user ||= build(:user, email: 'test@tango.com')
  end
end

RSpec.configure do |config|
  config.include ControllerHelpers, type: :controller
end
