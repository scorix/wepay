module Wepay
  class << self
    def sign(params, config)
      Digest::MD5.hexdigest(string_params_without_sign(params, config)).upcase
    end

    def string_params_without_sign(params, config)
      sorted_params = preprocess_params(params).sort_by { |k, _| k }
      (sorted_params << ['key', config.api_key]).map { |x| x.join('=') }.join('&')
    end

    def params_with_sign(params, config, sign_key: "sign")
      params_dup = preprocess_params(params)
      params_dup.merge(sign_key => Wepay.sign(params, config))
    end

    private
    def preprocess_params(params)
      params_dup = params.dup
      stringified_keys_params = {}
      params_dup.each do |k, v|
        next if blank?(v)
        stringified_keys_params[k.to_s] = v
      end
      stringified_keys_params.delete('key')
      stringified_keys_params
    end

    def blank?(v)
      !v || v.nil? || (v.respond_to?(:empty?) && v.empty?)
    end
  end
end
