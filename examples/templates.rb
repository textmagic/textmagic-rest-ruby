require 'rubygems'
require 'textmagic-ruby'
require './auth_helper'

puts ' *** Running template examples *** '
# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

client = Textmagic::REST::Client.new username, api_key

interval = 0.5

temp_name = 'Ruby Template'
temp_content = 'Dear {First Name} {Last Name}'
sleep interval
template = client.templates.create({:name => temp_name, :content => temp_content})

puts template.respond_to? :id
puts template.respond_to? :href

sleep interval
template.refresh

puts template.name == temp_name
puts template.content == temp_content

sleep interval
template = client.templates.get(template.id)

puts template.name == temp_name
puts template.content == temp_content

sleep interval
templates = client.templates.list()

puts templates.respond_to? :page
puts templates.respond_to? :limit
puts templates.respond_to? :page_count
puts templates.resources.length > 0
puts templates.resources.first.instance_of? Textmagic::REST::Template

sleep interval

search_templates = client.templates.list({:search => true, :name => template.name})

puts search_templates.instance_of? Textmagic::REST::PaginateResource
puts search_templates.resources.length == 1
puts search_templates.resources.first.id == template.id

sleep interval
template = client.templates.update(template.id, {:name => 'Updated Ruby Template', :content => temp_content})
sleep interval
template.refresh

puts template.name == 'Updated Ruby Template'

sleep interval
r = client.templates.delete(template.id)

puts r
sleep interval

puts ' *** Finish template examples *** '