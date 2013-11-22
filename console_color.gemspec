# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'console_color/version'

Gem::Specification.new do |spec|
  spec.name          = "console_color"
  spec.version       = ConsoleColor::VERSION
  spec.authors       = ["Joey Aghion"]
  spec.email         = ["joey@aghion.com"]
  spec.description   = %q{Add color-coded app and environment information to the Rails console prompt.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/joeyAghion/console_color"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
