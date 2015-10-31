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

puts "Creating a new custom field with the name: #{field_name}"
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
    puts "Failed to create the new custom field due to this exception:"
    puts e.message
    puts e.backtrace
  end
end

puts "The new custom field's id: #{custom_field.id}"
puts "The new custom field's URL: #{custom_field.href}"
# Note that this custom field object does NOT have a name
puts "Does the new custom field object have a name? #{custom_field.respond_to? :name}"

# But, you can get the name on this object by "refreshing" it
custom_field.refresh()
puts "The new custom field name: #{custom_field.name}"

sleep interval
# Retrieve the field by its ID
retrieved_field = client.custom_fields.get(custom_field.id)

updated_field_name = 'An updated example custom field'
sleep interval
# Delete an existing custom field with the updated name, if one exists
delete_custom_field client, updated_field_name

sleep interval
updated_field = client.custom_fields.update(retrieved_field.id, {:name => updated_field_name})
puts "Before refresh - does the updated custom field have a name? #{updated_field.respond_to? :name}"

sleep interval
updated_field.refresh()
puts "The updated custom field name after refresh: #{updated_field.name}"

sleep interval
list = client.lists.create({:name => 'A New Contact List'})
sleep interval
contact = client.contacts.create({:phone => '99991738182', :lists => list.id})

sleep interval
updated_contact = client.custom_fields.update_value(field.id, {:contactId => contact.id, :value => 'new value'})

sleep interval
contact.refresh()

sleep interval
r = client.custom_fields.delete(custom_field.id)
puts r

sleep interval
puts client.lists.delete(list.id)

sleep interval

