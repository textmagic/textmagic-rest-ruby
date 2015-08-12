require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running session examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

session_text = 'Ruby Session Text'
session_phones = '999999999, 9999191919'

sleep 0.5
session = client.messages.create({:text => session_text, :phones => session_phones})

sleep 0.5
sessions = client.sessions.list()

puts sessions.respond_to? :page
puts sessions.respond_to? :limit
puts sessions.respond_to? :page_count
puts sessions.resources.length > 0
puts sessions.resources.first.instance_of? Textmagic::REST::Session

sleep 0.5
session = client.sessions.get(session.id)

puts session.id == sessions.resources.first.id
puts session.respond_to? :start_time
puts session.respond_to? :text
puts session.respond_to? :source
puts session.respond_to? :reference_id
puts session.respond_to? :price
puts session.respond_to? :numbers_count

sleep 0.5
session_messages = client.sessions.messages(session.id)

puts session_messages.respond_to? :page
puts session_messages.respond_to? :limit
puts session_messages.respond_to? :page_count
puts session_messages.resources.length == 2
puts session_messages.resources.first.instance_of? Textmagic::REST::Message

sleep 0.5
r = client.sessions.delete(session.id)

puts r

puts ' *** Finish session examples *** '