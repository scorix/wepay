module Wepay
  def self.sign(params, nonce_str = SecureRandom.urlsafe_base64.tr('-_', ''))
    sorted_params = preprocess_params(params, nonce_str).sort_by { |k, _| k }
    str = (sorted_params << ['key', Wepay.config.api_key]).map { |x| x.join('=') }.join('&')
    Digest::MD5.hexdigest(str).upcase
  end

  def self.params_with_sign(params, nonce_str = SecureRandom.urlsafe_base64.tr('-_', ''))
    params_dup = preprocess_params(params, nonce_str)
    params_dup.merge('sign' => Wepay.sign(params, nonce_str))
  end

  private
  def self.preprocess_params(params, nonce_str)
    params_dup = params.dup
    stringified_keys_params = {}
    params_dup.each do |k, v|
      next if blank?(v)
      stringified_keys_params[k.to_s] = v
    end
    stringified_keys_params.delete('key')
    stringified_keys_params['nonce_str'] ||= nonce_str
    stringified_keys_params
  end

  def blank?(v)
    !v || v.nil? || (v.respond_to?(:empty?) && v.empty?)
  end
end