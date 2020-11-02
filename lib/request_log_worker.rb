class RequestLogWorker
  include Sidekiq::Worker

  sidekiq_options queue: :request_log

  def perform(params_json)
    params = JSON.parse(params_json, symbolize_names: true)
    Requests.create(params)
  end
end
