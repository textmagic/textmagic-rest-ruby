require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

puts ' *** Running invoice examples *** '
# This is the preferred method for specifying your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

interval = 0.5

client = Textmagic::REST::Client.new username, api_key

sleep interval
invoices = client.invoices.list()

puts invoices.respond_to? :page
puts invoices.respond_to? :limit
puts invoices.respond_to? :page_count
puts invoices.resources.length > 0
puts invoices.resources.first.instance_of? Textmagic::REST::Invoice

puts invoices.resources.first.respond_to? :id
puts invoices.resources.first.respond_to? :bundle
puts invoices.resources.first.respond_to? :currency
puts invoices.resources.first.respond_to? :vat
puts invoices.resources.first.respond_to? :payment_method

puts ' *** Finish invoice examples *** '