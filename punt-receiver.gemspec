# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'punt/receiver/version'

Gem::Specification.new do |spec|
  spec.name          = "punt-receiver"
  spec.version       = Punt::Receiver::VERSION
  spec.authors       = ["Rodrigo Flores"]
  spec.email         = ["mail@rodrigoflores.org"]
  spec.summary       = %q{Given a config file and a github token, checks for open PRs}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "5.6.1"

  spec.add_runtime_dependency "octokit", ["~> 3.0"]
end
