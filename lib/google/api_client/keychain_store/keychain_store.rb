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
    items.where(:service => @service).all.each(&:delete)
    nil
  end

  private

  def credentials
    item = items.where(:service => @service).first
    item ? item.password : nil
  end

  def credentials=(json)
    item = items.where(:service => @service).first

    if item
      item.password = json
      item.save!
    else
      item = items.create(:service => @service, :account => @service, :password => json)
    end

    json
  end


  def items
    Keychain.default.generic_passwords
  end
end
