describe Wepay do
  describe "#sign" do
    let(:config) { Wepay::Config.new(appid: 'wxd930ea5d5a258f4f',
                                     mch_id: '10000100',
                                     api_key: '192006250b4c09247ec02edce69f6a2d') }

    let(:params) { {device_info: '1000', body: 'test'} }

    context :sign do
      subject { Wepay.sign(params, config, 'ibuaiVcKdpRxkhJA') }
      it { is_expected.to eql '9A0A8659F005D6984697E2CA0A9CF3B7' }
    end

    context :string_params_without_sign do
      subject { Wepay.string_params_without_sign(params, config, 'ibuaiVcKdpRxkhJA') }
      it { is_expected.to eql 'appid=wxd930ea5d5a258f4f&body=test&device_info=1000&mch_id=10000100&nonce_str=ibuaiVcKdpRxkhJA&key=192006250b4c09247ec02edce69f6a2d' }
    end

    context :params_with_sign do
      subject { Wepay.params_with_sign(params, config, 'ibuaiVcKdpRxkhJA') }
      it { is_expected.to eql "device_info" => "1000",
                              "body" => "test",
                              "appid" => "wxd930ea5d5a258f4f",
                              "mch_id" => "10000100",
                              "nonce_str" => "ibuaiVcKdpRxkhJA",
                              "sign" => "9A0A8659F005D6984697E2CA0A9CF3B7" }
    end
  end
end
