module Wepay
  class API
    include ::HTTParty
    base_uri 'https://api.mch.weixin.qq.com'
    disable_rails_query_string_format
    default_timeout 10
    format :xml
  end
end