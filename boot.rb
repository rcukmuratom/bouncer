require 'dotenv/load'

require 'rollbar'
if ENV.include?('ROLLBAR_ACCESS_TOKEN')
  Rollbar.configure do |config|
    config.access_token = ENV.fetch('ROLLBAR_ACCESS_TOKEN')
  end
end

require 'active_record'
RACK_ENV ||= ENV['RACK_ENV'] || 'development'

if ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  ActiveRecord::Base.establish_connection(YAML.load(File.read(File.expand_path('../config/database.yml', __FILE__)))[RACK_ENV])
end

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'bouncer'
