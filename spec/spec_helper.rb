$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wepay'
require 'rspec'
require 'webmock/rspec'
require 'fakes/fake_wechat'

RSpec.configure do |c|
  c.before do
    stub_request(:any, /#{Wepay::API.base_uri}/).to_rack(FakeWechat)
  end
end