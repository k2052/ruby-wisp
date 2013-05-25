# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'wisp/version'

Gem::Specification.new do |s|
  s.name          = 'ruby-wisp'
  s.version       = Wisp::VERSION
  s.authors       = ['Yuri Artemev']
  s.email         = ['i@artemeff.com']
  s.description   = %q{Ruby Wisp is a wrapper to the JS Wisp compiler}
  s.summary       = %q{Ruby Wisp compiler}
  s.homepage      = 'https://github.com/artemeff/ruby-wisp'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)

  s.add_dependency 'execjs'
  s.add_dependency 'ruby-wisp-source'

  s.add_development_dependency 'rails', '>= 4.0.0.beta', '< 5.0'
  s.add_development_dependency 'rake'
end
