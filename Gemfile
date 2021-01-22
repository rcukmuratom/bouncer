source "https://rubygems.org/"

gem "activerecord", "~> 6.0.3" # Ideally version should be synced with Transition
gem "erubis", "2.7.0"
gem "nokogiri", "1.10.10"
gem "optic14n", "2.0.1" # Ideally version should be synced with Transition
gem "pg", "1.1.4"
gem "rack", "~> 2.2.3"

gem "dotenv"
gem "foreman", "~>0.87.2"
gem "puma", "~> 5.0.4"
gem "rake", "13.0.1"
gem "rollbar", "~> 3.0"
gem "sidekiq", "~> 6.1.3"

group :development do
  gem "mr-sparkle", "0.3.0"
end

group :test do
  gem "database_cleaner", "1.8.5"
  gem "pry"
  gem "rack-test", "1.1.0"
  gem "simplecov"
end

group :development, :test do
  gem "rspec"
  gem "rubocop-govuk"
end

group :development, :test do
  gem "byebug", "~> 11.1.3"
end
