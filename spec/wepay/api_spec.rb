require 'spec_helper'

describe Wepay::API do

  before do
    Wepay.config do |config|
      config.appid = 'abc'
    end
  end

  describe 'default params' do
    it 'should configure correctly' do
      expect(Wepay.config.appid).to eql 'abc'
      res = Wepay::API.post '/pay/unifiedorder'

      expect(res.parsed_response['return_code']).to eql 'SUCCESS'
    end
  end
end