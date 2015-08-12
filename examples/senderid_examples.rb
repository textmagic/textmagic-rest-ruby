require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running senderid examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

sid = 'rubysid'
exp = 'needs for api testing'
sleep 0.5
senderid = client.senderids.create({:senderId => sid, :explanation => exp})

puts senderid.instance_of? Textmagic::REST::Senderid
puts senderid.respond_to? :id
puts senderid.respond_to? :href

sleep 0.5
senderid.refresh

puts senderid.respond_to? :id
puts senderid.respond_to? :sender_id
puts senderid.respond_to? :user
puts senderid.user.kind_of? Hash
puts senderid.respond_to? :status

sleep 0.5
senderids = client.senderids.list()

puts senderids.respond_to? :page
puts senderids.respond_to? :limit
puts senderids.respond_to? :page_count
puts senderids.resources.length > 0
puts senderids.resources.first.instance_of? Textmagic::REST::Senderid

sleep 0.5
senderid = client.senderids.get senderid.id

puts senderid.respond_to? :id
puts senderid.respond_to? :sender_id
puts senderid.respond_to? :user
puts senderid.user.kind_of? Hash
puts senderid.respond_to? :status

sleep 0.5
r = client.senderids.delete senderid.id

puts r

puts ' *** Finish senderid examples *** '