require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running invoice examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

sleep 0.5
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