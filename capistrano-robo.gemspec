# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/robo/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-robo"
  spec.version       = Capistrano::Robo::VERSION
  spec.authors       = ["Eduardo Sampaio"]
  spec.email         = ["eduardo@sampa.io"]
  spec.summary       = %q{Robo support for Capistrano 3.X}
  spec.description   = %q{Add the capability to run Robo tasks on Capistrano 3.X}
  spec.homepage      = "https://github.com/esampaio/capistrano-robo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '~> 3.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
