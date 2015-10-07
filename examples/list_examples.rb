require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running list examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

list_name = 'new_list_ruby_test'
sleep 0.5
new_list = client.lists.create({:name => list_name})

puts new_list.instance_of? Textmagic::REST::List
puts !new_list.id.nil?
puts !new_list.href.nil?

sleep 0.5
lists = client.lists.list()

puts lists.instance_of?(Textmagic::REST::PaginateResource)
puts !lists.page.nil?
puts !lists.limit.nil?
puts !lists.page_count.nil?
puts lists.resources.length > 0
puts lists.resources.first.instance_of? Textmagic::REST::List

sleep 0.5
list = client.lists.get(new_list.id)

puts list.id == new_list.id
puts list.name == list_name
puts list.instance_of? Textmagic::REST::List

sleep 0.5
search_list = client.lists.list({:search => true, :ids => list.id})

puts lists.instance_of? Textmagic::REST::PaginateResource
puts !lists.page.nil?
puts !lists.limit.nil?
puts !lists.page_count.nil?
puts lists.resources.length > 0
puts lists.resources.first.instance_of? Textmagic::REST::List
puts lists.resources.first.name == list_name

sleep 0.5
updated_list_name = 'updated_list_ruby_test'
updated_list = client.lists.update(new_list.id, {:name => updated_list_name})

puts !updated_list.href.nil?

updated_list.refresh

puts updated_list.name == updated_list_name

contact = client.contacts.create({:phone => '99999999', :lists => updated_list.id})

contacts = client.lists.contacts(list.id)

puts contacts.page == 1
puts contacts.limit == 10
puts contacts.page_count == 1
puts contacts.resources.length == 1
puts contacts.resources.first.id == contact.id

r = client.lists.delete_contacts(list.id, {:contacts => contact.id})

puts r

contacts = client.lists.contacts(list.id)

puts contacts.resources.length == 0

contact = client.contacts.create({:phone => '999999990', :lists => list.id})

list = client.lists.put_contacts(list.id, {:contacts => contact.id})

puts list.id != 0
puts !list.href.nil?

contacts = client.lists.contacts(list.id)

puts contacts.resources.length == 1

r = client.lists.delete(list.id)
puts r

puts ' *** Finish list examples *** '