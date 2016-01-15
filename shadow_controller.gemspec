# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shadow_controller/version'

Gem::Specification.new do |spec|
  spec.name          = "shadow_controller"
  spec.version       = ShadowController::VERSION
  spec.authors       = ["Miles Stanfield"]
  spec.email         = ["milesstanfield@gmail.com"]

  spec.summary       = %q{An RSpec helper that makes testing your rails ApplicationController a cool breeze.}
  spec.description   = %q{Testing your ApplicationController often requires using the AnonymousController and drawing custom routes. This helper does all that for you and prevents you from having to update your AnonymousController whenever you make a change to the ApplicationController.'}
  spec.homepage      = "https://github.com/milesstanfield/shadow_controller"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rspec-rails', '~> 3.4.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
