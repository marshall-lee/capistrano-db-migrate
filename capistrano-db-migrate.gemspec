# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-db-migrate"
  gem.version       = '1.0.0'
  gem.authors       = ["Vladimir Kochnev"]
  gem.email         = ["hashtable@yandex.ru"]
  gem.description   = %q{Database migration tasks for Capistrano. Recommended to use with Padrino framework}
  gem.summary       = %q{Database migration tasks for Capistrano}
  gem.homepage      = "https://github.com/marshall-lee/capistrano-db-migrate"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '~> 3.1'
  gem.add_dependency 'capistrano-bundler', '~> 1.1'
end
