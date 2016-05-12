module Wepay
  class Config
    attr_accessor :appid, :mch_id, :app_secret, :api_key
    attr_accessor :cert_type, :cert_file, :cert_password
    attr_accessor :adapter

    def initialize(options = {})
      @appid = options[:appid]
      @mch_id = options[:mch_id]
      @app_secret = options[:app_secret]
      @api_key = options[:api_key]
      @cert_type = options[:cert_type]
      @cert_file = options[:cert_file]
      @cert_password = options[:cert_password]
      @adapter = options[:adapter]
    end
  end
end
