require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

username, api_key = tm_credentials

interval = 0.5

client = Textmagic::REST::Client.new username, api_key

list_name = 'An Example Contact List'
puts "Creating a new list with the name: #{list_name}"
params = { name: list_name }

sleep interval
new_list = client.lists.create(params)

sleep interval
list = client.lists.get(new_list.id)
puts "The retrieved list name: #{list.name}"

sleep interval
params = { limit: 25 } # The default limit is 10
lists = client.lists.list params
puts "We found a total of #{lists.resources.length} contact lists"

params = {
    search: true,
    ids: new_list.id
}
sleep interval
lists = client.lists.list params
puts "We found #{lists.resources.length} matching list(s)"

contact_phone = '19025552671'
params = {
    phone: contact_phone,
    lists: new_list.id
}

sleep interval
new_contact = client.contacts.create(params)
puts "The new contact ID: #{new_contact.id}"
puts "The new contact URL: #{new_contact.href}"

sleep interval
contact = client.contacts.get(new_contact.id)
puts "The retrieved contact's ID: #{contact.id}"

params[:first_name] = 'Zigmund'
sleep interval
u = client.contacts.update(contact.id, params)
puts "The contact's first name: #{contact.first_name}"

sleep interval
contact.refresh
puts "After a refresh, the contact's first name: #{contact.first_name}"

sleep interval
contact_list = client.contacts.list()
puts "We found a total of #{contact_list.resources.length} contacts"

sleep interval
contact_list = client.contacts.list({search: true, list_id: list.id})
puts "We found #{contact_list.resources.length} contacts in the new list: #{list.name}"
puts contact_list.resources.first.id == contact.id

sleep interval
contact_lists = client.contacts.lists(contact.id)
puts contact_lists.resources.length == 1
puts contact_lists.resources.first.id == list.id

sleep interval
puts "Deleting the contact #{new_contact.first_name}"
r = client.contacts.delete(new_contact.id)

sleep interval
puts "Deleting the list #{new_list.name}"
r = client.lists.delete new_list.id

