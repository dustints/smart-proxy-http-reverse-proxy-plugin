# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reverse_proxy_plugin/version'

Gem::Specification.new do |gem|
  gem.name          = "smart_proxy_reverse_proxy"
  gem.version       = ReverseProxy::VERSION
  gem.authors       = ['']
  gem.email         = ['']
  gem.homepage      = "https://github.com/theforeman/smart-proxy-pulp-plugin"
  gem.summary       = %q{Basic support for reverse proxy in the Smart-Proxy}
  gem.description   = <<-EOS
    Basic support for Katello Rhsm 
  EOS

  gem.files         = Dir['{bundler.d,lib,settings.d}/**/*', 'LICENSE', 'Gemfile']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.license = 'GPLv3'

  # todo: add a runtime dependency on smart-proxy
  gem.add_development_dependency('test-unit', '~> 2')
  gem.add_development_dependency('mocha', '~> 1')
  gem.add_development_dependency('webmock', '~> 1')
  gem.add_development_dependency('rack-test', '~> 0')
  gem.add_development_dependency('rake', '~> 10')
  gem.add_development_dependency('smart_proxy', '~> 1.7.0')
end


