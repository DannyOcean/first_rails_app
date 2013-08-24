source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'protected_attributes'
gem 'bootstrap-sass', '2.3.2.0'
gem 'devise'
gem 'bcrypt-ruby', '3.0.1'
gem 'rake-compiler'
gem 'haml-rails'
gem 'font-awesome-sass-rails'
gem 'client_side_validations',
  github: 'bcardarella/client_side_validations',
  branch: '4-0-beta'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
end
