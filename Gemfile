source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'puma',                   '~> 3.1'
gem 'secure_headers',         '~> 3.0'
gem 'pg',                     '~> 0.18.4'
gem 'active_model_serializers', '~> 0.10.0.rc4'
gem 'rack-cors',              '~> 0.4.0'
gem 'bcrypt',                 '~> 3.1'
gem 'sinatra',                github: 'sinatra/sinatra', branch: 'master'
gem 'refile',                 github: 'ddomingues/refile', branch: 'rails-5', require: 'refile/rails'
# gem 'refile',                 '~> 0.6.2'
gem 'refile-mini_magick',     '~> 0.2.0'

# Remove it when the rspec include this fix: https://github.com/rspec/rspec-core/pull/2197
gem 'rake'

group :production, :staging do
  gem 'rails_12factor',       '0.0.3'
  gem 'newrelic_rpm',         '~> 3.15.0'
  gem 'rollbar',              '~> 2.8'
  gem 'librato-rails',        '~> 1.2'
  gem 'refile-s3',            '~> 0.2.0'
end

group :development do
  gem 'foreman',              '0.78.0'
  gem 'binding_of_caller',    '0.7.2'
  gem 'letter_opener',        '1.4.1'
  gem 'bullet',               '~> 5.0'
  gem 'listen',               '~> 3.0.5'
end

group :test do
  gem 'shoulda-matchers',     '~> 3.1.1'
  gem 'simplecov',            '0.10.0', require: false
  gem 'email_spec',           '1.6.0'
  gem 'database_cleaner',     '1.4.1'
  gem 'codeclimate-test-reporter', require: false
  gem 'rspec-rails',           '>= 3.5.0.beta1'
  gem 'rails-controller-testing', '~> 0.1.1'
end

group :development, :test do
  gem 'factory_girl_rails',    '~> 4.6'
  gem 'pry-rails',             '0.3.4'
  gem 'dotenv-rails',          '1.0.2'
  gem 'awesome_print',         '1.6.1'
  gem 'spring-commands-rspec', '1.0.4'
  gem 'byebug',                '5.0.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
