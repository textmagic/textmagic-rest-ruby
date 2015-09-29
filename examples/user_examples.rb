require 'rubygems'
require 'textmagic-ruby'

puts ' *** Running user examples *** '

username = ''
token = ''

interval = 0.7

client = Textmagic::REST::Client.new username, token
sleep interval
sources = client.users.sources

puts sources.instance_of? Textmagic::REST::Source
puts sources.respond_to? :dedicated
puts sources.dedicated.kind_of? Array
puts sources.respond_to? :user
puts sources.user.kind_of? Array
puts sources.respond_to? :shared
puts sources.shared.kind_of? Array
puts sources.respond_to? :sender_ids
puts sources.sender_ids.kind_of? Array

sleep interval
m_stat = client.users.messaging_stat

puts m_stat.kind_of? Array
puts !m_stat.empty?
puts m_stat.first.key? 'replyRate'
puts m_stat.first.key? 'date'
puts m_stat.first.key? 'deliveryRate'
puts m_stat.first.key? 'costs'
puts m_stat.first.key? 'messagesReceived'
puts m_stat.first.key? 'messagesSentDelivered'
puts m_stat.first.key? 'messagesSentAccepted'
puts m_stat.first.key? 'messagesSentBuffered'
puts m_stat.first.key? 'messagesSentFailed'
puts m_stat.first.key? 'messagesSentRejected'
puts m_stat.first.key? 'messagesSentParts'

sleep interval
s_stat = client.users.spending_stat()

puts s_stat.instance_of? Textmagic::REST::PaginateResource
puts s_stat.resources.first.instance_of? Textmagic::REST::SpendingStat
puts s_stat.resources.first.respond_to? :id
puts s_stat.resources.first.respond_to? :user_id
puts s_stat.resources.first.respond_to? :date
puts s_stat.resources.first.respond_to? :balance
puts s_stat.resources.first.respond_to? :delta
puts s_stat.resources.first.respond_to? :type
puts s_stat.resources.first.respond_to? :value
puts s_stat.resources.first.respond_to? :comment

sleep interval
user = client.users.get

puts user.instance_of? Textmagic::REST::User
puts user.respond_to? :id
puts user.respond_to? :username
puts user.respond_to? :first_name
puts user.respond_to? :last_name
puts user.respond_to? :status
puts user.respond_to? :balance
puts user.respond_to? :company
puts user.respond_to? :currency
puts user.respond_to? :timezone
puts user.respond_to? :subaccount_type

params = {
    :first_name => 'John',
    :last_name => 'Doe',
    :company => user.company
}
sleep interval
user_updated = client.users.update params

puts !(user_updated.respond_to? :first_name)
puts !(user_updated.respond_to? :last_name)
puts !(user_updated.respond_to? :company)

sleep interval
user_updated.refresh

puts user_updated.first_name == 'John'
puts user_updated.last_name == 'Doe'
puts user_updated.company == user.company

params = {
    :firstName => user.first_name,
    :lastName => user.last_name,
    :company => user.company
}
sleep interval
user_updated = client.users.update params
sleep interval
user_updated.refresh

puts user_updated.first_name == user.first_name
puts user_updated.last_name == user.last_name
puts user_updated.company == user.company
sleep interval

(0..4).map {puts client.ping; sleep interval}

puts ' *** Finish user examples *** '