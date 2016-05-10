$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wepay'
require 'rspec'
require 'rspec/its'
require 'webmock/rspec'
require 'fakes/fake_wechat'

RSpec.configure do |c|
  c.before { stub_request(:any, /https:\/\/api\.mch\.weixin\.qq\.com/).to_rack(FakeWechat) }
end
