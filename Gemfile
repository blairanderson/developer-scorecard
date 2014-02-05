ruby '2.1.0'
source 'https://rubygems.org'

gem 'rails', '4.1.0.beta1'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass', path: './gems/bootstrap-sass-rails'
gem 'font-awesome-rails', git: 'https://github.com/blairanderson/font-awesome-rails'
gem 'momentjs-rails', '2.4.0'

gem 'active_model_serializers'
gem 'ember-rails'
gem 'ember-source'
gem 'simple_form'
gem 'newrelic_rpm'
gem 'devise'
gem 'omniauth'
gem 'omniauth-github'
gem 'rack-cors', :require => 'rack/cors'
gem 'simple_enum'
gem 'httparty'

group :production do
 gem 'pg'
 gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'sqlite3'
  gem 'guard-rspec'
  gem 'capybara'
  gem 'rspec-rails', '~> 2.0'
  gem 'launchy'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :test do
  gem 'vcr', '2.8.0'
  gem 'webmock', '1.8.0'
  gem 'shoulda-matchers'
end