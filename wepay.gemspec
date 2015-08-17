# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wepay/version'

Gem::Specification.new do |spec|
  spec.name          = 'wepay'
  spec.version       = Wepay::VERSION
  spec.authors       = ['scorix']
  spec.email         = ['scorix@liulishuo.com']

  spec.summary       = %q{A gem for payment in wechat.}
  spec.description   = %q{api doc: https://pay.weixin.qq.com/wiki/doc/api/app.php?chapter=9_1}
  spec.homepage      = 'https://github.com/lingochamp/wepay'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
end
