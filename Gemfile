source 'https://rubygems.org'

ruby "2.1.2"

gem 'rails', '3.2.17'

gem 'jquery-rails'
gem 'omniauth-twitter'
gem 'rest-client'
gem 'rails_config'
gem 'newrelic_rpm'
gem 'unicorn'

group :development, :test do
	gem 'rspec-rails'
end

group :development, :test, :herokuproduction do
	gem 'thin'
end

group :development, :test, :production do
	gem 'sqlite3'
end

group :assets do
	gem 'sass', '3.2.10'
	gem 'sass-rails'
	gem 'coffee-rails'
	gem 'uglifier'
end

group :test do
	gem 'capybara', '1.1.2'
	gem 'webmock'
end

group :herokuproduction do
	gem 'pg'
end

