# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mines_field/version'

Gem::Specification.new do |spec|
  spec.name          = 'mines_field'
  spec.version       = MinesField::VERSION
  spec.authors       = ['kisakov']
  spec.email         = ['isakov90@gmail.com']

  spec.summary       = 'Coding exercise for CrowdFlower'
  spec.description   = 'Simple algorithm of Field of mines'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'state_machines', '0.4.0'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '>= 0.48.1'
  spec.add_development_dependency 'rspec', '~> 3'
end
