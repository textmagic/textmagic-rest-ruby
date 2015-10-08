require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running bulk examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

sleep 0.5
bulks = client.bulks.list

puts bulks.respond_to? :page
puts bulks.respond_to? :limit
puts bulks.respond_to? :page_count
puts bulks.resources.length > 0

sleep 0.5
bulk = client.bulks.get(bulks.resources.first.id)

puts bulk.id == bulks.resources.first.id

puts ' *** Finish bulk examples *** '