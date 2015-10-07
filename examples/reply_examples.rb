require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running reply examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

inbox = client.replies.list

puts inbox.instance_of? Textmagic::REST::PaginateResource
puts inbox.resources.length > 0
puts inbox.resources.first.instance_of? Textmagic::REST::Reply

reply = client.replies.get inbox.resources.first.id

puts reply.respond_to? :id
puts reply.respond_to? :sender
puts reply.respond_to? :message_time
puts reply.respond_to? :text
puts reply.respond_to? :receiver

r = client.replies.delete reply.id

puts r

puts ' *** Finish reply examples *** '