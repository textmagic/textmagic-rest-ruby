require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

puts ' *** Running subaccount examples *** '
# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

interval = 0.5

client = Textmagic::REST::Client.new username, api_key
sleep interval
subs = client.subaccounts.list

sleep interval
sub = client.subaccounts.get subs.resources.first.id
puts subs.instance_of? Textmagic::REST::PaginateResource
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

# sleep interval
# You cannot use free/public email addresses e.g. gmail, yahoo, etc.
# subaccount_email = 'someuser@somedomain.com'
# r = client.subaccounts.send_invite({:email => subaccount_email, :role => 'A'})
# puts r
# sleep interval
# r = client.subaccounts.delete sub.id
# puts r

puts ' *** Finish subaccount examples *** '