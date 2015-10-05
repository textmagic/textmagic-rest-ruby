require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
user_name, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# user_name = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

begin
  sleep 1 # Let's try to avoid rate restrictions per https://www.textmagic.com/docs/api/restrictions/#api-request-frequency-limit
  client = Textmagic::REST::Client.new user_name, api_key

  # First, let's see if we've received any messages
  received_messages = client.replies.list(limit: 10, page: 1)
  if received_messages.resources.length == 0
    puts 'We haven\'t received any SMS messages with our TextMagic account yet'
  else
    received_messages.resources.each do |rm|
      puts "The received message id: #{rm.id}"
      puts "The message text: #{rm.text}"
      puts "The message was sent by: #{rm.sender}"
      puts "The message was received by: #{rm.receiver}"
      puts "The message was received at: #{rm.message_time}"
      puts ''
    end
  end
rescue Textmagic::REST::RequestError => e
  puts e.message
  puts e.backtrace
end
