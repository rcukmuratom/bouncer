require "dotenv/load"

RACK_ENV ||= ENV["RACK_ENV"] || "development"

require "rollbar"
if ENV.include?("ROLLBAR_ACCESS_TOKEN")
  Rollbar.configure do |config|
    config.access_token = ENV.fetch("ROLLBAR_ACCESS_TOKEN")
    # If you run your staging application instance in production environment then
    # you'll want to override the environment reported by `RACK_ENV` with an
    # environment variable like this: `ROLLBAR_ENV=staging`. This is a recommended
    # setup for Heroku. See:
    # https://devcenter.heroku.com/articles/deploying-to-a-custom-rails-environment
    config.environment = ENV.fetch("ROLLBAR_ENV", RACK_ENV)
  end
end

require "active_record"
if ENV["DATABASE_URL"]
  ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
else
  ActiveRecord::Base.establish_connection(YAML.safe_load(ERB.new(File.read(File.expand_path("config/database.yml", __dir__))).result)[RACK_ENV])
end

$LOAD_PATH.unshift File.expand_path("lib", __dir__)

require "bouncer"
