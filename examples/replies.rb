require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

puts ' *** Running reply examples *** '
# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

interval = 0.5

client = Textmagic::REST::Client.new username, api_key

sleep interval
inbox = client.replies.list

puts inbox.instance_of? Textmagic::REST::PaginateResource
puts inbox.resources.length > 0
puts inbox.resources.first.instance_of? Textmagic::REST::Reply

sleep interval
reply = client.replies.get inbox.resources.first.id

puts reply.respond_to? :id
puts reply.respond_to? :sender
puts reply.respond_to? :message_time
puts reply.respond_to? :text
puts reply.respond_to? :receiver

sleep interval
r = client.replies.delete reply.id

puts r

puts ' *** Finish reply examples *** '