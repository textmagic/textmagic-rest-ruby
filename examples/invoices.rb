require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

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

invoices.resources.each do |inv|
  puts "The invoice ID: #{inv.id}"
  puts "The bundle amount: #{inv.bundle}"
  puts "The currency: #{inv.currency}"
  puts "The VAT: #{inv.vat}"
  puts "The payment method description: #{inv.payment_method}"
end


