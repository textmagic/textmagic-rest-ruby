require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

puts ' *** Running message examples *** '
# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

interval = 0.5

client = Textmagic::REST::Client.new username, api_key

text = 'Hello from Ruby Api Helper'
phones = '999777777'
params = {
    :text => text,
    :phones => phones
}
sleep interval
new_message = client.messages.create(params)

puts new_message.id > 0
puts !new_message.href.nil?
puts !new_message.message_id.nil?
puts !new_message.session_id.nil?

sleep interval
message = client.messages.get(new_message.id)

puts message.id == new_message.id
puts message.text == text

params = {
    :page => 2
}
sleep interval
messages = client.messages.list(params)

puts messages.page == 2
puts messages.page_count > 0
puts messages.resources.kind_of? Array
puts messages.resources.length == 10

sleep interval

params = {
    :search => true,
    :ids => new_message.id
}
messages_search = client.messages.list(params)

puts messages_search.page == 1
puts messages_search.page_count > 0
puts messages_search.resources.kind_of? Array
puts messages_search.resources.length == 1
puts messages_search.resources.first.id == new_message.id

sleep interval
r = client.messages.delete new_message.id
puts r

sleep interval
begin
  message = client.messages.get(new_message.id)
rescue Textmagic::REST::RequestError => err
  puts err.code == 404
end

sleep interval
price = client.messages.price({:text => 'Hello from Ruby Helper', :phones => '19025555555, 16465555555'})

puts price.total > 0
puts price.parts == 1

sleep interval

puts ' *** Finish message examples *** '