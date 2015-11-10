class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :integration_type, inclusion: { in: 1..3 }, allow_blank: true

  before_create :generate_token

  enum integration: %w(facebook google+ instagram)

  private
  def generate_token
    self.token = SecureRandom.urlsafe_base64(24)
  end
end
