# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omochialienify/version'

Gem::Specification.new do |spec|
  spec.name          = "omochialienify"
  spec.version       = Omochialienify::VERSION
  spec.authors       = ["Tony Miller"]
  spec.email         = ["mcfiredrill@gmail.com"]
  spec.summary       = %q{おもちエリアン}
  spec.description   = %q{omochialienifies your images}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "cocaine"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
