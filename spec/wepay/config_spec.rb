describe Wepay do
  describe "#configure" do
    subject { Wepay::Client.new(appid: 'abc') }

    its(:config) { is_expected.to be_a Wepay::Config }
    its('config.appid') { is_expected.to eql 'abc' }
  end
end
