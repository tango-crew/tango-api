FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User##{n}" }
    email { "#{name.downcase}@tango.com" }
    token 'token'
    integration_id '3323232'
    integration_type 1
    birthday '2015-11-05'
    bio 'My bio'
    password { SecureRandom.urlsafe_base64 }
    password_confirmation { password }
  end
end
