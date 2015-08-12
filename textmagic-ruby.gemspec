# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'textmagic-ruby/rest/version'

Gem::Specification.new do |spec|
  spec.name          = 'textmagic-ruby'
  spec.version       = Textmagic::REST::VERSION
  spec.authors       = ['Andrey Larionov']
  spec.email         = ['andrey@textmagic.biz']

  spec.summary       = %q{TextMagic APIv2 client.}
  spec.description   = %q{TextMagic APIv2 client}
  spec.homepage      = "https://github.com/textmagic/textmagic-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.required_ruby_version = '>= 1.9.2'

  spec.extra_rdoc_files = ['README.md' ]
  spec.rdoc_options = ['--line-numbers', '--inline-source', '--title', 'textmagic-ruby', '--main', 'README.md']

  spec.add_dependency('multi_json', '>= 1.5.0')
  spec.add_dependency('jruby-openssl') if RUBY_PLATFORM == 'java'
  spec.add_dependency('rubysl') if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'

  spec.add_development_dependency "bundler", "~> 1.10"
end
