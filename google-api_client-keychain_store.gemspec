# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google/api_client/keychain_store/version'

Gem::Specification.new do |spec|
  spec.name          = 'google-api_client-keychain_store'
  spec.version       = Google::APIClient::KeychainStore::VERSION
  spec.authors       = ['Genki Sugawara']
  spec.email         = ['sugawara@cookpad.com']
  spec.summary       = %q{KeychainStore for Google API Client.}
  spec.description   = %q{KeychainStore for Google API Client.}
  spec.homepage      = 'https://github.com/winebarrel/google-api_client-keychain_store'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'google-api-client'
  spec.add_dependency 'security'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'google_drive-persistent_session', '~> 0.1.2'
end
