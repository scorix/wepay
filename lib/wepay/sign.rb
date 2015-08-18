module Wepay
  def self.sign(params, nonce_str = SecureRandom.urlsafe_base64.tr('-_', ''))
    preprocess_params(params, nonce_str)
    str = params.sort.map { |x| x.join('=') }.join('&')
    str_with_key = "#{str}&key=#{Wepay.config.api_key}"
    Digest::MD5.hexdigest(str_with_key).upcase
  end

  def self.params_with_sign(params, nonce_str = SecureRandom.urlsafe_base64.tr('-_', ''))
    params[:sign] = Wepay.sign(params, nonce_str)
    params
  end

  private
  def self.preprocess_params(params, nonce_str)
    params.merge!(appid: Wepay.config.appid, mch_id: Wepay.config.mch_id)
    params.delete(:key)
    params[:nonce_str] ||= nonce_str
    params
  end
end