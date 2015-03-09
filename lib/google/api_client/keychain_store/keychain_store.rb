class Google::APIClient::KeychainStore
  def initialize(service = 'google-api_client-keychain_store')
    @service = service
  end

  def load_credentials
    credentials ? JSON.parse(credentials) : nil
  rescue JSON::ParserError
    nil
  end

  def write_credentials(credentials_hash)
    self.credentials = credentials_hash.to_json
    credentials_hash
  end

  def delete_credentials
    if Security::GenericPassword.find(:service => @service)
      Security::GenericPassword.delete(:service => @service)
    end

    nil
  end

  private

  def credentials
    item = Security::GenericPassword.find(:service => @service)
    item ? item.password : nil
  end

  def credentials=(json)
    delete_credentials
    Security::GenericPassword.add(@service, @service, json)
    json
  end
end
