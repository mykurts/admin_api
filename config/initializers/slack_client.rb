require 'slack-ruby-client'

Slack.configure do |config|
  config.token = Rails.configuration.settings[:slack_client][:token]
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end