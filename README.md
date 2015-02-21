# Google::APIClient::KeychainStore

KeychainStore for [Google API Client](https://github.com/google/google-api-ruby-client).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google-api_client-keychain_store'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google-api_client-keychain_store

## Usage

```ruby
#!/usr/bin/env ruby

# see https://github.com/winebarrel/google_drive-persistent_session
require 'google_drive/persistent_session'

require 'google/api_client/keychain_store'

GoogleDrive::CredentialStorage.store = Google::APIClient::KeychainStore.new('google_drive-oauth2.json')

session = GoogleDrive::PersistentSession.login

session.files.each do |file|
  puts file.title
end
```
