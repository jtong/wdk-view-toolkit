# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wdk-view-toolkit/version'

Gem::Specification.new do |spec|
  spec.name          = "wdk-view-toolkit"
  spec.version       = WDK::View::Toolkit::VERSION
  spec.authors       = ["jtong"]
  spec.email         = ["tj19832@gmail.com"]
  spec.description   = %q{ runtime method }
  spec.summary       = %q{runtime method }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
