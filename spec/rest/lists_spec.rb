require 'spec_helper'

describe Textmagic::REST::List do
  before do
    @list = Textmagic::REST::List.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@list.instance_variable_get(:@client)).to eq('mockClient')
    expect(@list.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@list).to respond_to(method)
    end
  end
end

describe Textmagic::REST::Lists do
  before do
    @lists = Textmagic::REST::Lists.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete, :contacts, :delete_contacts, :put_contacts].each do |method|
    it "should have method #{method}" do
      expect(@lists).to respond_to(method)
    end
  end

  it 'sets up a client and path' do
    expect(@lists.instance_variable_get(:@client)).to eq('mockClient')
    expect(@lists.instance_variable_get(:@path)).to eq('mockPath')
  end
end