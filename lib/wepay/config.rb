module Wepay
  class Config
    attr_accessor :appid, :mch_id, :app_secret, :api_key
    attr_accessor :cert_type, :cert_file, :cert_password
    attr_accessor :adapter
  end
end
