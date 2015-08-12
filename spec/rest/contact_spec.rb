require 'spec_helper'

describe Textmagic::REST::Contact do
  before do
    @contact = Textmagic::REST::Contact.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@contact.instance_variable_get(:@client)).to eq('mockClient')
    expect(@contact.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@contact).to respond_to(method)
    end
  end

end

describe Textmagic::REST::Contacts do
  before do
    @contacts = Textmagic::REST::Contacts.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete, :lists].each do |method|
    it "should have method #{method}" do
      expect(@contacts).to respond_to(method)
    end
  end

  it 'sets up a client and path' do
    expect(@contacts.instance_variable_get(:@client)).to eq('mockClient')
    expect(@contacts.instance_variable_get(:@path)).to eq('mockPath')
  end
end