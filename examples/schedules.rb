require 'rubygems'
require 'textmagic-ruby'
require 'time'
require './auth_helper'

puts ' *** Running schedule examples *** '
# This is the preferred method to pass your API credentials
# set the environment variables TEXTMAGIC_USERNAME and TEXTMAGIC_API_KEY in your shell
username, api_key = tm_credentials

# If you must, you can uncomment and assign the credential variables here
# username = 'your_text_magic_username'
# api_key = 'your_text_magic_api_key'

interval = 0.5

client = Textmagic::REST::Client.new username, api_key

sd_text = "I'm a scheduled message"
sd_phones = '999999999'
sleep interval
scheduled = client.messages.create({:text => sd_text, :phones => sd_phones, :sendingTime => Time.now.to_i + 10000})

puts !scheduled.id.nil?
puts scheduled.message_id.nil?
puts scheduled.session_id.nil?
puts scheduled.bulk_id.nil?
puts !scheduled.schedule_id.nil?
puts !scheduled.href.nil?

sleep interval
scheduled = client.schedules.get(scheduled.id)

puts !scheduled.id.nil?
puts !scheduled.next_send.nil?
puts !scheduled.session.empty?

sleep interval
scheduleds = client.schedules.list()

puts !scheduleds.page.nil?
puts !scheduleds.limit.nil?
puts !scheduleds.page_count.nil?
puts scheduleds.resources.length > 0
puts scheduleds.resources.first.instance_of? Textmagic::REST::Schedule

sleep interval
r = client.schedules.delete(scheduled.id)
puts r

puts ' *** Finish schedule examples *** '