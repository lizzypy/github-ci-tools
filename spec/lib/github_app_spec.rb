require 'spec_helper'
require_relative '../../lib/github_ci_tools/github_app'

RSpec.describe GitHubApp do
  let(:client_id) { 12345 }
  let(:app) { GitHubApp.new(client_id: client_id) }
  let(:rsa_key) { OpenSSL::PKey::RSA.new(2048) }
  let(:base64_key) { Base64.encode64(rsa_key.to_s) }

  before do
    allow(ENV).to receive(:fetch).with('GITHUB_PRIVATE_KEY_B64', '').and_return(base64_key)
    allow(ENV).to receive(:fetch).with('GITHUB_INSTALLATION_ID', '').and_return(1)
    stub_request(:post, 'https://api.github.com/app/installations/1/access_tokens')
      .with(headers: { 'Accept' => 'application/vnd.github.v3+json' })
      .to_return(status:, body: mock_response_body, headers: {})
  end

  context 'when the API call is successful' do
    let(:mock_response_body) { { 'token' => 'v1.1f699f1069f60xxx', 'expires_at' => '2020-08-10T14:48:00Z' }.to_json }
    let(:status) { 201 }


    it 'returns the token from the API response' do
      expect(app.token).to eq('v1.1f699f1069f60xxx')
    end
  end

  context 'when the API call fails' do
    let(:mock_response_body) { { 'message' => 'Bad credentials' }.to_json }
    let(:status) { 401 }

    it 'returns nil' do
      expect(app.token).to be_nil
    end
  end
end
