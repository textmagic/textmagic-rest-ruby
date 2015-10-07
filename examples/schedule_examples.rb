require 'rubygems'
require 'textmagic-ruby'
require 'time'

puts ' *** Running schedule examples *** '

username = 'xxx'
token = 'xxx'

client = Textmagic::REST::Client.new username, token

sd_text = "I'm a scheduled message"
sd_phones = '999999999'
scheduled = client.messages.create({:text => sd_text, :phones => sd_phones, :sendingTime => Time.now.to_i + 10000})

puts !scheduled.id.nil?
puts scheduled.message_id.nil?
puts scheduled.session_id.nil?
puts scheduled.bulk_id.nil?
puts !scheduled.schedule_id.nil?
puts !scheduled.href.nil?

scheduled = client.schedules.get(scheduled.id)

puts !scheduled.id.nil?
puts !scheduled.next_send.nil?
puts !scheduled.session.empty?

scheduleds = client.schedules.list()

puts !scheduleds.page.nil?
puts !scheduleds.limit.nil?
puts !scheduleds.page_count.nil?
puts scheduleds.resources.length > 0
puts scheduleds.resources.first.instance_of? Textmagic::REST::Schedule

r = client.schedules.delete(scheduled.id)
puts r

puts ' *** Finish schedule examples *** '