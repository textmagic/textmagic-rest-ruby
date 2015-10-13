require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

puts ' *** Running custom field examples *** '
# This is the preferred method for specifying your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

interval = 0.5

client = Textmagic::REST::Client.new username, api_key

field_name = 'Ruby Helper'
sleep interval
field_new = client.custom_fields.create(name: field_name)

puts !field_new.id.nil?
puts !field_new.href.nil?

sleep interval
field = client.custom_fields.get(field_new.id)

puts field.id == field_new.id
puts field.name == field_name

sleep interval
field_list = client.custom_fields.list()

puts !field_list.page.nil?
puts !field_list.limit.nil?
puts !field_list.page_count.nil?
puts field_list.resources.length > 0

sleep interval
field_search_list = client.custom_fields.list({:search => true})

puts !field_search_list.page.nil?
puts !field_search_list.limit.nil?
puts !field_search_list.page_count.nil?
puts field_search_list.resources.length > 0

updated_field_name = 'Ruby Helper Updated'
sleep interval
updated_field = client.custom_fields.update(field.id, {:name => updated_field_name})

puts updated_field.id == field.id
puts updated_field.href == "/api/v2/customfields/#{updated_field.id}"

sleep interval
updated_field.refresh()

puts updated_field.id == field.id
puts updated_field.name == updated_field_name

sleep interval
list = client.lists.create({:name => 'Custom Field Update Value'})
sleep interval
contact = client.contacts.create({:phone => '99991738182', :lists => list.id})

sleep interval
updated_contact = client.custom_fields.update_value(field.id, {:contactId => contact.id, :value => 'new value'})

puts contact.id == updated_contact.id
puts !updated_contact.href.nil?

sleep interval
contact.refresh()

puts contact.custom_fields[0]['value'] == 'new value'

sleep interval
r = client.custom_fields.delete(field_new.id)
puts r

sleep interval
puts client.lists.delete(list.id)

sleep interval

puts ' *** Finish custom field examples *** '