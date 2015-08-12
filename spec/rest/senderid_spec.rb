require 'spec_helper'

describe Textmagic::REST::Senderid do
  before do
    @senderid = Textmagic::REST::Senderid.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@senderid.instance_variable_get(:@client)).to eq('mockClient')
    expect(@senderid.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@senderid).to respond_to(method)
    end
  end
end

describe Textmagic::REST::Senderids do
  before do
    @senderids = Textmagic::REST::Senderids.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete].each do |method|
    it "should have method #{method}" do
      expect(@senderids).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@senderids.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@senderids.instance_variable_get(:@client)).to eq('mockClient')
    expect(@senderids.instance_variable_get(:@path)).to eq('mockPath')
  end
end