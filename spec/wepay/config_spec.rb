require 'spec_helper'

describe Wepay do
  describe "#configure" do
    before do
      Wepay.config do |config|
        config.appid = 'abc'
      end
    end

    it 'should configure correctly' do
      expect(Wepay.config.appid).to eql 'abc'
    end
  end
end