require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'
client = Textmagic::REST::Client.new username, api_key

interval = 0.5
sleep interval

# Any phone number that starts with 999 is a test phone number
# A bulk message is one that is sent to more than 1000 recipients
bulk_number_list = '999'
1000.times do |n|
  bulk_number_list << ",999#{n}"
end

params = {phones: bulk_number_list, text: 'Sample text!'}
# This creates AND sends the outgoing messages
client.messages.create(params)

bulk_messages = client.bulks.list()

sleep interval

# Let's look at the last bulk message which we've just sent
# It will be the first element in the resources array
bulk_message = client.bulks.get(bulk_messages.resources.first.id)
puts "Bulk message id: #{bulk_message.id}"
puts "Bulk message status: #{bulk_message.status}"
puts "#{bulk_message.items_processed} out of #{bulk_message.items_total} have been processed"
puts "Bulk message text: #{bulk_message.text}"




