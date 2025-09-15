require 'rspec'
require 'webmock/rspec'
require 'openssl'
require 'base64'
require 'jwt'
require 'faraday'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end