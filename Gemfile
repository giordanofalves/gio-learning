# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.3.1"

gem "bootsnap", require: false
gem "pg"
gem "puma", ">= 5.0"
gem "rack-cors"
gem "rails", "~> 7.1.3", ">= 7.1.3.3"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "debug", platforms: %i[ mri windows ]
  gem "factory_bot_rails"
  gem "faker"
  gem "pry", "~> 0.14.2"
end

group :development do
  gem "annotate"
  gem "bullet"
  gem "rubocop", require: false
  gem "rubocop-rails_config"
  gem "web-console"
end

group :test do
  gem "rspec-rails", "~> 6.1.0"
  gem "shoulda-matchers", "~> 6.0"
  gem "simplecov", require: false
end
