require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running reply examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

sleep 0.5
inbox = client.replies.list

puts inbox.instance_of? Textmagic::REST::PaginateResource
puts inbox.resources.length > 0
puts inbox.resources.first.instance_of? Textmagic::REST::Reply

sleep 0.5
reply = client.replies.get inbox.resources.first.id

puts reply.respond_to? :id
puts reply.respond_to? :sender
puts reply.respond_to? :message_time
puts reply.respond_to? :text
puts reply.respond_to? :receiver

sleep 0.5
r = client.replies.delete reply.id

puts r

puts ' *** Finish reply examples *** '