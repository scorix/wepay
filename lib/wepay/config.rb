module Wepay
  class Config
    attr_accessor :appid, :mch_id

    def initialize(&block)
      if block_given?
        yield(self)
      end
      Wepay::API.default_params(appid: appid, mch_id: mch_id)
    end
  end

  def self.config(&block)
    @config ||= Config.new(&block)
  end
end