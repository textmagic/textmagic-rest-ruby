require 'spec_helper'

describe Textmagic::REST::Chats do

  it 'should set username and token when initialize' do
    client = Textmagic::REST::Client.new 'mock_user', 'mock_key'
    expect {client.chats.get_by_phone('')}.to raise_error Textmagic::REST::RequestError, 'You must specify a valid E.164 phone number.'
  end

end
