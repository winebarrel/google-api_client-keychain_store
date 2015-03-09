require 'google/api_client'

require 'security'

class Security::GenericPassword
  def self.delete(options)
    system "security delete-generic-password #{flags_for_options(options)} > /dev/null 2> /dev/null"
  end
end

require 'google/api_client/keychain_store/version'
require 'google/api_client/keychain_store/keychain_store'
