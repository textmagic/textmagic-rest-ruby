require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running chat examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

chats = client.chats.list()

puts !chats.page.nil?
puts !chats.limit.nil?
puts !chats.page_count.nil?
puts chats.resources.length > 0
puts chats.resources.first.instance_of? Textmagic::REST::Chat

chat_messages = client.chats.get_by_phone(chats.resources.first.phone)

puts !chat_messages.page.nil?
puts !chat_messages.limit.nil?
puts !chat_messages.page_count.nil?
puts chat_messages.resources.length > 0
puts chat_messages.resources.first.instance_of? Textmagic::REST::ChatMessage

puts ' *** Finish chat examples *** '