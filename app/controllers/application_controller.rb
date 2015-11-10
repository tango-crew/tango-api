class ApplicationController < ActionController::Base
  protect_from_forgery
  ensure_security_headers # See more: https://github.com/twitter/secureheaders

  before_action :validate_token
  before_action :load_user

  rescue_from Tango::UnauthorizedError, with: :unauthorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  attr_accessor :current_user

  private
  def validate_token
    raise Tango::UnauthorizedError unless token.present?
  end

  def token
    request.headers['X-Tango-Api-Token']
  end

  def unauthorized
    head :unauthorized
  end

  def load_user
    @current_user = User.find_by(token: token)
    raise ActiveRecord::RecordNotFound unless @current_user.present?
  end

  def not_found
    head :not_found
  end
end
