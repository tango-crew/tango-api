source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails',                  '4.2.3'
gem 'puma',                   '2.14.0'
gem 'secure_headers',         '2.2.2'
gem 'pg',                     '0.18.2'
gem 'active_model_serializers', '~> 0.9.3'

group :production, :staging do
  gem 'rails_12factor',       '0.0.3'
  gem 'rack-canonical-host',  '0.1.0'
  gem 'newrelic_rpm',         '~> 3.12'
  gem 'rollbar',              '2.1.1'
  gem 'librato-rails',        '0.11.1'
end

group :development do
  gem 'foreman',              '0.78.0'
  gem 'jumpup',               '0.0.8'
  gem 'jumpup-heroku',        '0.0.6'
  gem 'better_errors',        '2.1.1'
  gem 'binding_of_caller',    '0.7.2'
  gem 'letter_opener',        '1.4.1'
  gem 'bullet',               '4.14.7'
  gem 'quiet_assets',         '1.1.0'
end

group :test do
  gem 'shoulda-matchers',     '2.8.0', require: false
  gem 'simplecov',            '0.10.0', require: false
  gem 'email_spec',           '1.6.0'
  gem 'capybara',             '2.4.4'
  gem 'poltergeist',          '1.6.0'
  gem 'vcr',                  '2.9.3'
  gem 'webmock',              '1.21.0'
  gem 'database_cleaner',     '1.4.1'
end

group :development, :test do
  gem 'rspec-rails',           '3.3.3'
  gem 'factory_girl_rails',    '4.5.0'
  gem 'pry-rails',             '0.3.4'
  gem 'dotenv-rails',          '1.0.2'
  gem 'awesome_print',         '1.6.1'
  gem 'spring-commands-rspec', '1.0.4'
  gem 'byebug',                '5.0.0'
  gem 'spring',                '1.3.6'
end
