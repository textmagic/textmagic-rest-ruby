require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

# This is the preferred method for specifying your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

client = Textmagic::REST::Client.new username, api_key

chats = client.chats.list()
puts "We have #{chats.page_count} page#{chats.page_count == 1 ? '' : 's'} of chats"
puts "With up to #{chats.limit} chats per page"

# Check to see if we have any chats
if chats.resources.length > 0
  puts "We have a total of #{chats.resources.length} chats"
  chats.resources.each do |c|
    puts ''
    puts "Chat ID: #{c.id}"
    puts "Our chat partner's phone number: #{c.phone}"
    puts "There are #{c.unread} unread messages in this chat"
    puts "The contact (can be empty) for this chat is: #{c.contact}" # See https://www.textmagic.com/docs/api/contacts/
    puts "The last message was received in this chat on/at #{c.updated_at}"
  end
else
  puts "We don't have any chats yet"
end

# Let's look at some messages in the first chat we find
phone_number = chats.resources.first.phone
chat_messages = client.chats.get_by_phone(phone_number)
puts ''
puts "Here's a list of messages received from #{phone_number} in the chat with id: #{chats.resources.first.id}"
chat_messages.resources.each do |cm|
  # See the full list of chat message properties here: https://www.textmagic.com/docs/api/sms-chats/
  puts ''
  puts "The chat message ID: #{cm.id}"
  puts "Message text: #{cm.text}"
end

