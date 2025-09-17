# GitHub CI Tools

Authenticating to the GitHub API using a GitHub App is slightly more complicated than using a PAT but it is a more secure
method.

In order to make this easier in ruby application this gem includes executables that can generate an authentication token
or dispatch a GitHub event. 


## Usage

You must configure your GitHub App following the instructions [here](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/about-authentication-with-a-github-app).

You should ensure that the following ENV variables are set:
* CLIENT_ID
* GITHUB_INSTALLATION_ID
* GITHUB_PRIVATE_KEY_B64 - the base 64 encoded private key.

### Generating a token

`ruby -Ilib ./bin/generate_token`

### One way to encode your private key on a mac
Set the private key to an ENV variable:

`$ export MY_KEY="----BEGIN RSA..."`

`$ export ENCODED_KEY=(echo $MY_KEY | base64)`
