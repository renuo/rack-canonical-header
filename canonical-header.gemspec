$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'canonical-header/version'

puts 'Canonical gemspec'

Gem::Specification.new do |spec|
  spec.name          = 'canonical-header'
  spec.version       = Canonical::VERSION
  spec.authors       = ['Lukas Bischof']
  spec.email         = ['lukas.bischof@renuo.ch']
  spec.summary       = 'A gem that inserts a canonical http header'
  spec.description   = 'A canonical URL tag for better SEO'
  spec.homepage      = 'http://renuo.ch'

  spec.files = Dir['lib/**/*', 'Rakefile', 'README.md']
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.1.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'mdl'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
