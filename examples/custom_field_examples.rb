require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running custom field examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

field_name = 'Ruby Helper'
sleep 0.5
field_new = client.custom_fields.create({:name => field_name})

puts !field_new.id.nil?
puts !field_new.href.nil?

sleep 0.5
field = client.custom_fields.get(field_new.id)

puts field.id == field_new.id
puts field.name == field_name

sleep 0.5
field_list = client.custom_fields.list()

puts !field_list.page.nil?
puts !field_list.limit.nil?
puts !field_list.page_count.nil?
puts field_list.resources.length > 0

sleep 0.5
field_search_list = client.custom_fields.list({:search => true})

puts !field_search_list.page.nil?
puts !field_search_list.limit.nil?
puts !field_search_list.page_count.nil?
puts field_search_list.resources.length > 0

updated_field_name = 'Ruby Helper Updated'
sleep 0.5
updated_field = client.custom_fields.update(field.id, {:name => updated_field_name})

puts updated_field.id == field.id
puts updated_field.href == "/api/v2/customfields/#{updated_field.id}"

sleep 0.5
updated_field.refresh()

puts updated_field.id == field.id
puts updated_field.name == updated_field_name

sleep 0.5
list = client.lists.create({:name => 'Custom Field Update Value'})
sleep 0.5
contact = client.contacts.create({:phone => '99991738182', :lists => list.id})

sleep 0.5
updated_contact = client.custom_fields.update_value(field.id, {:contactId => contact.id, :value => 'new value'})

puts contact.id == updated_contact.id
puts !updated_contact.href.nil?

sleep 0.5
contact.refresh()

puts contact.custom_fields[0]['value'] == 'new value'

sleep 0.5
r = client.custom_fields.delete(field_new.id)
puts r

sleep 0.5
puts client.lists.delete(list.id)

sleep 0.5

puts ' *** Finish custom field examples *** '