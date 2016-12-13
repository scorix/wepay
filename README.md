# Wepay

微信支付

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wepay', github: "scorix/wepay"
```

And then execute:

    $ bundle

## Usage

### New a client

```
client = Wepay::Client.new(appid: 'wxd930ea5d5a258f4f', mch_id: '10000100', api_key: '192006250b4c09247ec02edce69f6a2d')
```

### [统一下单](https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_1)

```
client.unifiedorder(body, out_trade_no, total_fee, spbill_create_ip, notify_url)
```

### [查询订单](https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_2)

```
client.orderquery(out_trade_no)
```

or

```
# use transaction_id first
client.orderquery(out_trade_no, transaction_id: transaction_id)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/scorix/wepay/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
