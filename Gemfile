source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails',                  '~> 4.2.5'
gem 'puma',                   '~> 2.16'
gem 'secure_headers',         '2.2.2'
gem 'pg',                     '~> 0.18.4'
gem 'active_model_serializers', '~> 0.9.4'
gem 'rack-cors',              '~> 0.4.0'
gem 'bcrypt',                 '~> 3.1'

group :production, :staging do
  gem 'rails_12factor',       '0.0.3'
  gem 'rack-canonical-host',  '0.1.0'
  gem 'newrelic_rpm',         '~> 3.15.0'
  gem 'rollbar',              '~> 2.8'
  gem 'librato-rails',        '~> 1.1'
end

group :development do
  gem 'foreman',              '0.78.0'
  gem 'better_errors',        '2.1.1'
  gem 'binding_of_caller',    '0.7.2'
  gem 'letter_opener',        '1.4.1'
  gem 'bullet',               '~> 5.0'
end

group :test do
  gem 'shoulda-matchers',     '~> 3.1.1'
  gem 'simplecov',            '0.10.0', require: false
  gem 'email_spec',           '1.6.0'
  gem 'database_cleaner',     '1.4.1'
  gem 'codeclimate-test-reporter', require: false
end

group :development, :test do
  gem 'rspec-rails',           '~> 3.4.2'
  gem 'factory_girl_rails',    '~> 4.6'
  gem 'pry-rails',             '0.3.4'
  gem 'dotenv-rails',          '1.0.2'
  gem 'awesome_print',         '1.6.1'
  gem 'spring-commands-rspec', '1.0.4'
  gem 'byebug',                '5.0.0'
  gem 'spring',                '1.3.6'
end
