require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

interval = 0.5

client = Textmagic::REST::Client.new username, api_key

sleep interval
available = client.numbers.available({:country => 'US'})

puts "The price for a number is #{available.price}"
puts 'The following numbers are available for purchase:'
available.numbers.each do |a|
  puts a
end

# NOTE: if you uncomment and run this code, it will purchase a new number for your TextMagic account
# You will still be charged for one month of usage even if you run the delete code below.
=begin
sleep interval
user = client.users.get

sleep interval
number = client.numbers.buy({:userId => user.id, :country => 'US', :phone => available.numbers.first})

sleep interval
number = client.numbers.get number.id
puts "The new phone number is #{number.phone}"
puts "The new number was purchased at: #{number.purchased_at}"
puts "It will expire at #{number.expire_at}"
puts "The country ISO code for this number: #{number.country}"
puts "The number's current status: #{number.status}"
=end

sleep interval
numbers = client.numbers.list()
puts "This account has a total of #{numbers.resources.length} numbers."

# Delete example
# sleep interval
# if client.numbers.delete(number.id)
#  puts "We just deleted the number #{number.phone}"
# end


