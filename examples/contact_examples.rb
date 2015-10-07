require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running contact examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

list_name = "TextMagic Ruby Helper"
params = {
    :name => list_name
}

new_list = client.lists.create(params)

list = client.lists.get(new_list.id)

puts list.name == list_name

params = {
    :limit => 25
}

lists = client.lists.list params

puts lists.resources.length > 0
puts lists.page == 1
puts lists.page_count == 1

params = {
    :search => true,
    :ids => new_list.id
}

lists = client.lists.list params

puts lists.page == 1
puts lists.resources.length == 1
puts lists.resources.first.name == list_name

contact_phone = '19025552671'
params = {
    :phone => contact_phone,
    :lists => new_list.id
}

new_contact = client.contacts.create(params)

puts new_contact.id > 0
puts !new_contact.href.nil?

contact = client.contacts.get(new_contact.id)

puts contact.id == new_contact.id
puts contact.phone == contact_phone

params[:first_name] = 'Zigmund'
u = client.contacts.update(contact.id, params)

puts u.id == contact.id
puts !u.href.nil?

puts contact.first_name != 'Zigmund'

contact.refresh
puts contact.first_name == 'Zigmund'

contact = client.contacts.get(new_contact.id)
puts contact.first_name == 'Zigmund'

contact_list = client.contacts.list()

puts !contact_list.page.nil?
puts !contact_list.limit.nil?
puts !contact_list.page_count.nil?
puts contact_list.resources.length > 0

contact_list = client.contacts.list({:search=> true, :list_id => list.id})

puts !contact_list.page.nil?
puts !contact_list.limit.nil?
puts !contact_list.page_count.nil?
puts contact_list.resources.length == 1
puts contact_list.resources.first.id == contact.id

contact_lists = client.contacts.lists(contact.id)

puts !contact_lists.page.nil?
puts !contact_lists.limit.nil?
puts !contact_lists.page_count.nil?
puts contact_lists.resources.length == 1
puts contact_lists.resources.first.id == list.id

r = client.contacts.delete(new_contact.id)
puts r

r = client.lists.delete new_list.id
puts r

puts ' *** Finish contact examples *** '