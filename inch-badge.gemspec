# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inch/badge/version'

Gem::Specification.new do |spec|
  spec.name          = "inch-badge"
  spec.version       = Inch::Badge::VERSION
  spec.authors       = ["René Föhring"]
  spec.email         = ["rf@bamaru.de"]
  spec.summary       = %q{Rubygem that generates badges for Inch}
  spec.description   = %q{Rubygem that generates badges for Inch}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "chunky_png"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
