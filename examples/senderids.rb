require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running senderid examples *** '

username = ''
token = ''

interval = 0.7

client = Textmagic::REST::Client.new username, token

sid = 'rubysid'
exp = 'needs for api testing'
sleep interval
senderid = client.senderids.create({:senderId => sid, :explanation => exp})

puts senderid.instance_of? Textmagic::REST::Senderid
puts senderid.respond_to? :id
puts senderid.respond_to? :href

sleep interval
senderid.refresh

puts senderid.respond_to? :id
puts senderid.respond_to? :sender_id
puts senderid.respond_to? :user
puts senderid.user.kind_of? Hash
puts senderid.respond_to? :status

sleep interval
senderids = client.senderids.list()

puts senderids.respond_to? :page
puts senderids.respond_to? :limit
puts senderids.respond_to? :page_count
puts senderids.resources.length > 0
puts senderids.resources.first.instance_of? Textmagic::REST::Senderid

sleep interval
senderid = client.senderids.get senderid.id

puts senderid.respond_to? :id
puts senderid.respond_to? :sender_id
puts senderid.respond_to? :user
puts senderid.user.kind_of? Hash
puts senderid.respond_to? :status

sleep interval
r = client.senderids.delete senderid.id

puts r

puts ' *** Finish senderid examples *** '