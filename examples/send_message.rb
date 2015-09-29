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
  client = Textmagic::REST::Client.new user_name, api_key
  # Any phone number that starts with 999 is a test phone number, replace the phones
  # parameter with a real number to send an SMS message to an actual device
  params = {phones: '999123456', text: 'Sample text!'}

  # Sleep to avoid rate limiting
  # See https://www.textmagic.com/docs/api/restrictions/#api-request-frequency-limit
  sleep 1

  # This line creates and sends the outgoing message
  outgoing_message = client.messages.create(params)
  puts "The message id is: #{outgoing_message.id}"
  puts "The message URL is: #{outgoing_message.href}"
  # See the full set of available properties here: https://www.textmagic.com/docs/api/send-sms/#response

  sleep 1
  # Now that we've sent the message, let's fetch data about it from the API
  messages = client.messages.list(params)
  sent_message = messages.resources.find { |m| m.id == outgoing_message.id }

  # For more information about message statuses,
  # see https://www.textmagic.com/docs/api/sms-sessions/#message-delivery-statuses
  puts "The message status is: #{sent_message.status}"
  puts "The sender's phone number is: #{sent_message.sender}"
  puts "The message text: #{sent_message.text}"

  # See the full set of available properties here:
  # https://www.textmagic.com/docs/api/sms-sessions/#get-a-specific-message-details

rescue Textmagic::REST::RequestError => e
  puts e.message
  puts e.backtrace
end
