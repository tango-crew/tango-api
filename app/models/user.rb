class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :integration_type, inclusion: { in: 1..3 }, allow_blank: true
  validates_presence_of :password_confirmation, if: :password
  validates_confirmation_of :password, if: :password

  has_secure_password validations: false

  before_create :generate_token

  enum integration: %w(facebook google+ instagram)

  def self.authenticate!(email, password)
    find_by!(email: email)&.
        authenticate(password)
  end

  private
  def generate_token
    self.token = SecureRandom.urlsafe_base64(24)
  end
end
