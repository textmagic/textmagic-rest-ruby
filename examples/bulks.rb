require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running bulk examples *** '

username = ''
token = ''

interval = 0.7

client = Textmagic::REST::Client.new username, token

sleep interval
bulks = client.bulks.list

puts bulks.respond_to? :page
puts bulks.respond_to? :limit
puts bulks.respond_to? :page_count
puts bulks.resources.length > 0

sleep interval

if bulks.resources.length > 0
  bulk = client.bulks.get(bulks.resources.first.id)

  puts bulk.id == bulks.resources.first.id
end

puts ' *** Finish bulk examples *** '