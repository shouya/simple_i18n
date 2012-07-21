# -*- encoding: utf-8; ruby -*-

require File.expand_path('../lib/simple_i18n/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Shou Ya"]
  gem.email         = ["shouyatf@gmail.com"]
  gem.description   = 'A simple internationalization library for ' \
                      'easily creating multilanguage ruby program'
  gem.summary       = gem.description

  gem.homepage      = "https://github.com/shouya/simple_i18n" # TODO

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple_i18n"
  gem.require_paths = ["lib"]
  gem.version       = SimpleI18n::VERSION
end
