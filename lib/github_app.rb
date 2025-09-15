# frozen_string_literal: true

require 'openssl'
require 'jwt'
require 'faraday'
require 'json'

# Represents a GitHub App that has permissions for specific repos.
# For the permission details to perform required actions on the GitHub
# API see the GitHub documentation.
class GitHubApp
  def initialize(client_id:)
    @client_id = client_id
  end

  def token
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization' => "Bearer #{jwt}",
        'Accept' => 'application/vnd.github.v3+json'
      }
    )

    response = conn.post("app/installations/#{ENV.fetch('GITHUB_INSTALLATION_ID', '')}/access_tokens")

    if response.success?
      response_body = JSON.parse(response.body)
      response_body['token']
    else
      puts "API call failed! Response status: #{response.status}"
      puts "Response body: #{response.body}"
    end
  end

  private

  attr_reader :client_id

  def jwt
    decoded_key = Base64.decode64(ENV.fetch('GITHUB_PRIVATE_KEY_B64', ''))
    private_key = OpenSSL::PKey::RSA.new(decoded_key)

    payload = {
      iat: Time.now.to_i,
      exp: Time.now.to_i + (9 * 60),
      iss: client_id
    }

    JWT.encode(payload, private_key, 'RS256')
  end
end
