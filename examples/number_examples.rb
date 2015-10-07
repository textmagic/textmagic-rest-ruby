require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running number examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

available = client.numbers.available({:country => 'US'})

puts available.respond_to? :numbers
puts available.numbers.kind_of? Array
puts !available.numbers.empty?
puts available.numbers.length > 0
puts available.respond_to? :price
puts available.price > 0

user = client.users.get

puts user.instance_of? Textmagic::REST::User
puts user.respond_to? :first_name
puts user.respond_to? :last_name
puts user.respond_to? :company
puts user.respond_to? :timezone
puts user.timezone.kind_of? Hash
puts user.respond_to? :id
puts user.respond_to? :username
puts user.respond_to? :status
puts user.respond_to? :balance
puts user.respond_to? :currency
puts user.currency.kind_of? Hash
puts user.respond_to? :subaccount_type

# number = client.numbers.buy({:userId => user.id, :country => 'US', :phone => available.numbers.first})
#
# puts number.instance_of? Textmagic::REST::Number
# puts number.respond_to? :id
# puts number.respond_to? :href

# number = client.numbers.get number.id
#
# puts number.respond_to? :id
# puts number.respond_to? :user
# puts number.user.kind_of? Hash
# puts number.respond_to? :purchased_at
# puts number.respond_to? :expire_at
# puts number.respond_to? :phone
# puts number.respond_to? :country
# puts number.country.kind_of? Hash
# puts number.respond_to? :status

numbers = client.numbers.list()

puts numbers.respond_to? :page
puts numbers.respond_to? :limit
puts numbers.respond_to? :page_count
puts numbers.resources.length > 0
puts numbers.resources.first.instance_of? Textmagic::REST::Number

# r = client.numbers.delete(number.id)
#
# puts r

puts ' *** Finish number examples *** '