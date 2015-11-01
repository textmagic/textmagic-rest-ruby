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

field_name = 'An example custom field'
sleep interval

def delete_custom_field(client, name)
  # Pick an arbitrary but "large enough" limit for results, the default is 10
  custom_fields = client.custom_fields.list(limit: 500)
  # There is currently no search for custom fields, so iterate over them
  custom_fields.resources.each do |cf|
    if cf.name == name
      client.custom_fields.delete(cf.id)
    end
  end
end

puts "Creating a custom field with the name: #{field_name}"
# Add some extra handling in case this custom field already exists
custom_field = nil
begin
  custom_field = client.custom_fields.create(name: field_name)
rescue Textmagic::REST::RequestError => e
  if e.message.include? 'This field already exists'
    delete_custom_field client, field_name
    # Existing field should be gone now, try again
    custom_field = client.custom_fields.create(name: field_name)
  else
    puts "Failed to create the custom field due to this exception:"
    puts e.message
    puts e.backtrace
  end
end

puts "The custom field's id: #{custom_field.id}"
puts "The custom field's URL: #{custom_field.href}"
# Note that this custom field object does NOT have a name
puts "Does the custom field object have a name? #{custom_field.respond_to? :name}"

# But, you can get the name on this object by "refreshing" it
custom_field.refresh
puts "The custom field name: #{custom_field.name}"

sleep interval
# Retrieve the field by its ID
retrieved_field = client.custom_fields.get(custom_field.id)

updated_field_name = 'An updated example custom field'
sleep interval
# Delete an existing custom field with the updated name, if one exists
delete_custom_field client, updated_field_name

sleep interval
client.custom_fields.update(retrieved_field.id, {:name => updated_field_name})

sleep interval
puts "The updated custom field name before a refresh: #{custom_field.name}"
custom_field.refresh
puts "The updated custom field name after a refresh: #{custom_field.name}"

# Create a new contact list or use one if it already exists with the name list_name
sleep interval
list_name = 'A New Contact List'
list_search = client.lists.list(search: true, name: list_name)
contact_list = nil
if list_search.resources.length == 1
  contact_list = list_search.resources[0]
else
  sleep interval
  contact_list = client.lists.create({:name => 'A New Contact List'})
end

# Do the same for a new contact
sleep interval
phone_number = '99991738182'
contact_search = client.contacts.list(search: true, query: phone_number)
contact = nil
if contact_search.resources.length == 1
  contact = contact_search.resources[0]
else
  sleep interval
  contact = client.contacts.create({:phone => phone_number, :lists => contact_list.id})
  # Note that if we've just created a contact, we need to refresh here to get it custom_fields property
  sleep interval
  contact.refresh
end

sleep interval
client.custom_fields.update_value(custom_field.id, {:contactId => contact.id, :value => 'Custom Field Value!'})

sleep interval
puts "Before the refresh, the contact's custom field array has #{contact.custom_fields.length} elements"
contact.refresh
puts "After the refresh, the contact's custom field data is: #{contact.custom_fields[0]}"

# Clean up the test data now
sleep interval
puts "Did we successfully delete the new custom field? #{client.custom_fields.delete(custom_field.id)}"

sleep interval
puts "Did we successfully delete the new contact? #{client.contacts.delete(contact.id)}"

sleep interval
puts "Did we successfully delete the new contact list? #{client.lists.delete(contact_list.id)}"


