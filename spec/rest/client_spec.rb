require 'spec_helper'

describe Textmagic::REST::Client do

  it 'should set username and token when initialize' do
    client = Textmagic::REST::Client.new 'johnsmith', 'auth_token'
    expect(client.username).to eq('johnsmith')
    expect(client.token).to eq('auth_token')
  end

  it 'should throw an error if the username and token is not set' do
    expect{Textmagic::REST::Client.new}.to raise_error(ArgumentError)
  end

  it 'should throw an error if only username or only token set' do
    expect{Textmagic::REST::Client.new 'username'}.to raise_error(ArgumentError)
    expect{Textmagic::REST::Client.new nil, 'token'}.to raise_error(ArgumentError)
  end

  [:messages, :contacts, :lists, :custom_fields, :unsubscribers,
   :bulks, :chats, :schedules, :sessions, :templates, :invoices, :users,
   :numbers, :senderids, :subaccounts, :replies, :post, :get,
   :put, :delete].each do |method|
    it "should have method #{method}." do
      client = Textmagic::REST::Client.new 'username', 'token'
      expect(client).to respond_to(method)
    end
  end

  it 'should not raise an error if response body is empty' do
    FakeWeb.register_uri(:any, %r/api\.textmagictesting\.com/, body: '')
    client = Textmagic::REST::Client.new 'username', 'token'
    client.messages.delete 1
  end

  it 'should change default connection address' do
    client = Textmagic::REST::Client.new 'username', 'token', 'https://api.something.com'
    conn = client.instance_variable_get(:@conn)
    expect(conn.address).to eq('api.something.com')
  end

  it 'should set up proper default ssl connection' do
    client = Textmagic::REST::Client.new 'username', 'token'
    conn = client.instance_variable_get(:@conn)
    expect(conn.address).to eq('api.textmagictesting.com')
    expect(conn.port).to eq(443)
    expect(conn.use_ssl?).to eq(true)
  end

  it 'should have a ping method' do
    FakeWeb.register_uri(:any, %r/api\.textmagictesting\.com/, body: '{"ping": "pong"}')
    client = Textmagic::REST::Client.new 'username', 'token'
    expect(client).to respond_to(:ping)
    expect(client.ping).to eq('pong')
  end

end