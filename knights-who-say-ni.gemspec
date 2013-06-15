# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knights_who_say_ni/version'

Gem::Specification.new do |spec|
  spec.name          = "knights-who-say-ni"
  spec.version       = KnightsWhoSayNi::VERSION
  spec.authors       = ["Richard W. Norton"]
  spec.email         = ["rwtnorton@gmail.com"]
  spec.description   = %q{Counts non-capture positions of knights on NxM board.}
  spec.summary       = %q{NI!}
  spec.homepage      = 'https://github.com/rwtnorton/knights-who-say-ni'
  spec.license       = 'GPLv3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency 'minitest'
  spec.add_runtime_dependency 'turn'
end
