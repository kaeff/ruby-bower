# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-bower/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby-bower"
  gem.version       = RubyBower::VERSION
  gem.authors       = ["Klaus Fleerkötter"]
  gem.email         = ["hi@kaeff.net"]
  gem.description   = %q{A ruby wrapper for Bower}
  gem.summary       = gem.description
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'execjs'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
end
