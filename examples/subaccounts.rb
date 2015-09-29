require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running subaccount examples *** '

username = ''
token = ''

interval = 0.7

client = Textmagic::REST::Client.new username, token
sleep interval
subs = client.subaccounts.list

puts subs.instance_of? Textmagic::REST::PaginateResource
puts subs.resources.first.instance_of? Textmagic::REST::Subaccount
puts subs.resources.first.respond_to? :id
puts subs.resources.first.respond_to? :username
puts subs.resources.first.respond_to? :first_name
puts subs.resources.first.respond_to? :last_name
puts subs.resources.first.respond_to? :status
puts subs.resources.first.respond_to? :balance
puts subs.resources.first.respond_to? :company
puts subs.resources.first.respond_to? :currency
puts subs.resources.first.respond_to? :timezone
puts subs.resources.first.respond_to? :subaccount_type

sleep interval
sub = client.subaccounts.get subs.resources.first.id

puts subs.resources.first.instance_of? Textmagic::REST::Subaccount
puts sub.respond_to? :id
puts sub.respond_to? :username
puts sub.respond_to? :first_name
puts sub.respond_to? :last_name
puts sub.respond_to? :status
puts sub.respond_to? :balance
puts sub.respond_to? :company
puts sub.respond_to? :currency
puts sub.respond_to? :timezone
puts sub.respond_to? :subaccount_type


sleep interval
random_email = (0...10).map { ('a'..'z').to_a[rand(26)] }.join << '@mailinator.com'
r = client.subaccounts.send_invite({:email => random_email, :role => 'A'})

puts r

sleep interval
r = client.subaccounts.delete sub.id

puts r

puts ' *** Finish subaccount examples *** '