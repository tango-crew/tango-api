Jumpup::Heroku.configure do |config|
  config.app = 'tango-api'
end if Rails.env.development?
