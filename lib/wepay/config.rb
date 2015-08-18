module Wepay
  class Config
    attr_accessor :appid, :mch_id, :app_secret
    attr_accessor :cert_type, :cert_file, :cert_password

    def initialize(&block)
      if block_given?
        yield(self)
      end

      Wepay::API.default_params(appid: appid, mch_id: mch_id, app_secret: app_secret)

      # clear cert options
      Wepay::API.default_options.delete(:p12)
      Wepay::API.default_options.delete(:p12_password)
      Wepay::API.default_options.delete(:pem)
      Wepay::API.default_options.delete(:pem_password)

      # set cert option
      if File.exist?(cert_file.to_s) && cert_type.to_s
        Wepay::API.public_send(cert_type.to_sym, File.read(cert_file), cert_password)
      end
    end
  end

  def self.config(&block)
    block_given? ? @config = Config.new(&block) : @config
  end
end
