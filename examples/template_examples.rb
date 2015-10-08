require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running template examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

temp_name = 'Ruby Template'
temp_content = 'Dear {First Name} {Last Name}'
sleep 0.5
template = client.templates.create({:name => temp_name, :content => temp_content})

puts template.respond_to? :id
puts template.respond_to? :href

sleep 0.5
template.refresh

puts template.name == temp_name
puts template.content == temp_content

sleep 0.5
template = client.templates.get(template.id)

puts template.name == temp_name
puts template.content == temp_content

sleep 0.5
templates = client.templates.list()

puts templates.respond_to? :page
puts templates.respond_to? :limit
puts templates.respond_to? :page_count
puts templates.resources.length > 0
puts templates.resources.first.instance_of? Textmagic::REST::Template

sleep 0.5

search_templates = client.templates.list({:search => true, :name => template.name})

puts search_templates.instance_of? Textmagic::REST::PaginateResource
puts search_templates.resources.length == 1
puts search_templates.resources.first.id == template.id

sleep 0.5
template = client.templates.update(template.id, {:name => 'Updated Ruby Template', :content => temp_content})
sleep 0.5
template.refresh

puts template.name == 'Updated Ruby Template'

sleep 0.5
r = client.templates.delete(template.id)

puts r
sleep 0.5

puts ' *** Finish template examples *** '