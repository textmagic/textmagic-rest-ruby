require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

# This is the preferred method for specifying your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

begin
  client = Textmagic::REST::Client.new username, api_key
  # Any phone number that starts with 999 is a test phone number, replace the phones
  # parameter with a real number to send an SMS message to an actual device
  params = {phones: '999123456', text: 'Sample text!'}

  # This creates AND sends the outgoing message
  outgoing_message = client.messages.create(params)

  # See the full set of available properties here:
  # https://www.textmagic.com/docs/api/send-sms/#response
  puts "The message id is: #{outgoing_message.id}"
  puts "The message URL is: #{outgoing_message.href}"

  # Now that we've sent the message, let's fetch data about it from the API
  messages = client.messages.list(params)
  sent_message = messages.resources.find { |m| m.id == outgoing_message.id }

  # For more information about message statuses,
  # Visit https://www.textmagic.com/docs/api/sms-sessions/#message-delivery-statuses
  # Also, for the full set of available properties,
  # Visit https://www.textmagic.com/docs/api/sms-sessions/#get-a-specific-message-details
  puts "The message status is: #{sent_message.status}"
  puts "The sender's phone number is: #{sent_message.sender}"
  puts "The message text: #{sent_message.text}"

rescue Textmagic::REST::RequestError => e
  puts e.message
  puts e.backtrace
end
