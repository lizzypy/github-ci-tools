# frozen_string_literal: true

Gem::Specification.new do |s|
  s.files = Dir.glob("lib/**/*")
  s.require_paths = ["lib"]

  s.name        = 'github_ci_tools'
  s.version     = '0.0.1'
  s.homepage    = 'https://github.com/lizzypy/github-ci-tools'
  s.summary     = 'Authenticate to the GitHub API using a GitHub App'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 3.0'

  s.author   = 'Liz Johnson'
  s.email    = 'lizdrennan8@gmail.com'

  s.license = 'MIT'

  s.files = Dir.glob("lib/**/*") + %w[Gemfile README.md]
  s.bindir        = "bin"
  s.executables = %w[generate_token]
  s.require_paths = %w[lib]

  s.add_runtime_dependency "faraday", "~> 1.0"
  s.add_runtime_dependency "json", "~> 2.6"
  s.add_runtime_dependency "jwt", "~> 2.8"
  s.add_runtime_dependency "openssl", "~> 3.0"

  s.add_development_dependency "rspec", "~> 3.12"
  s.add_development_dependency "webmock", "~> 3.18"
end
