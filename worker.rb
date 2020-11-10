require "sidekiq"

Sidekiq.configure_server do |config|
  config.error_handlers << proc do |ex, ctx_hash|
    Rollbar.error(ex, ctx_hash)
  end
end

require "./boot"
