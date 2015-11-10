FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User##{n}" }
    email { "#{name.downcase}@tango.com" }
    token 'token'
    integration_id '3323232'
    integration_type 1
    birthday '2015-11-05'
    bio 'My bio'
  end
end
