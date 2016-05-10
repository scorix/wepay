describe 'Wepay::Client' do
  shared_examples :api do
    context :unifiedorder do
      let(:response) { client.unifiedorder('', '', '', '', '') }
      subject { response['xml']['return_code'] }
      it { is_expected.to eql 'SUCCESS' }
    end

    context :orderquery do
      let(:response) { client.orderquery('') }
      subject { response['xml']['return_code'] }
      it { is_expected.to eql 'SUCCESS' }
    end

    context :closeorder do
      let(:response) { client.closeorder('') }
      subject { response['xml']['return_code'] }
      it { is_expected.to eql 'SUCCESS' }
    end

    context :downloadbill do
      let(:response) { client.downloadbill('20160501', bill_type: 'ALL') }
      subject { response }
      it { is_expected.to_not be_empty }
      it { is_expected.to be_a Array }
      its(:size) { is_expected.to eql 30 }
    end
  end

  context :httparty do
    let(:client) { Wepay::Client.new(appid: 'abc', adapter: :httparty) }
    include_examples :api
  end

  context :patron do
    let(:client) { Wepay::Client.new(appid: 'abc', adapter: :patron) }
    include_examples :api
  end
end
