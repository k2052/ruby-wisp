# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "wisp/version"

Gem::Specification.new do |s|
  s.name          = "ruby-wisp"
  s.version       = Wisp::VERSION
  s.authors       = ["Yuri Artemev"]
  s.email         = ["i@artemeff.com"]
  s.description   = %q{Ruby Wisp is a bridge to the JS Wisp compiler}
  s.summary       = %q{Ruby Wisp compiler}
  s.homepage      = "https://github.com/artemeff/ruby-wisp"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)

  s.add_dependency "ruby-wisp-source"
  s.add_dependency "execjs"
end
