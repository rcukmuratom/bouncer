require "spec_helper"

describe RequestLogWorker do
  it "creates a request" do
    params = {
      hostname: "dxw.com",
      path: "/",
      http_status: "301",
      hit_on: Date.today.iso8601,
    }
    expect(Requests).to receive(:create).with(params)
    subject.perform(params.to_json)
  end
end
