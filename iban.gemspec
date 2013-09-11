# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'iban/version'

Gem::Specification.new do |spec|
  spec.name          = "IBAN"
  spec.version       = IBAN::VERSION
  spec.authors       = ["Kevin"]
  spec.email         = ["kevin.melchert@gmail.com"]
  spec.description   = %q{IBAN: International Bank Account Number}
  spec.summary       = %q{IBAN information, validation and formatting.}
  spec.homepage      = "https://github.com/max-power/iban"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', "~> 4.2"
  spec.add_development_dependency 'activemodel'
end
