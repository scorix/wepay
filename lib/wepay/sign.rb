module Wepay
  class << self
    def sign(params, config, nonce_str = random_string)
      Digest::MD5.hexdigest(string_params_without_sign(params, config, nonce_str)).upcase
    end

    def string_params_without_sign(params, config, nonce_str = random_string)
      sorted_params = preprocess_params(params, nonce_str).sort_by { |k, _| k }
      (sorted_params << ['key', config.api_key]).map { |x| x.join('=') }.join('&')
    end

    def params_with_sign(params, config, nonce_str = random_string, sign_key: "sign")
      params_dup = preprocess_params(params, nonce_str)
      params_dup.merge(sign_key => Wepay.sign(params, config, nonce_str))
    end

    private
    def random_string
      SecureRandom.urlsafe_base64.tr('-_', '')
    end

    def preprocess_params(params, nonce_str)
      params_dup = params.dup
      stringified_keys_params = {}
      params_dup.each do |k, v|
        next if blank?(v)
        stringified_keys_params[k.to_s] = v
      end
      stringified_keys_params.delete('key')
      if stringified_keys_params.has_key?('nonce_str')
        stringified_keys_params['nonce_str'] ||= nonce_str
      elsif stringified_keys_params.has_key?('noncestr')
        stringified_keys_params['noncestr'] ||= nonce_str
      else
        stringified_keys_params['nonce_str'] = nonce_str
      end
      stringified_keys_params
    end

    def blank?(v)
      !v || v.nil? || (v.respond_to?(:empty?) && v.empty?)
    end
  end
end
