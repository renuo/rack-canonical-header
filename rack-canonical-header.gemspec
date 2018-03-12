$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'rack-canonical-header/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-canonical-header'
  spec.version       = Canonical::VERSION
  spec.authors       = ['Lukas Bischof']
  spec.email         = ['lukas.bischof@renuo.ch']
  spec.summary       = 'A gem that inserts a canonical http header'
  spec.description   = 'A canonical URL tag for better SEO and to prevent search engines from crawling different hosts'
  spec.homepage      = 'https://github.com/renuo/rack-canonical-header'

  spec.files = Dir['lib/**/*', 'Rakefile', 'README.md']
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.1.0'
  spec.license = 'MIT'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'mdl'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
