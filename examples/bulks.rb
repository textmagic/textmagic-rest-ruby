require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

puts ' *** Running bulk examples *** '

client = Textmagic::REST::Client.new username, api_key

interval = 0.5
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