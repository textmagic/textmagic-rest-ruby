require 'spec_helper'

describe Textmagic::REST::Message do
  before do
    @message = Textmagic::REST::Message.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@message.instance_variable_get(:@client)).to eq('mockClient')
    expect(@message.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@message).to respond_to(method)
    end
  end

end

describe Textmagic::REST::Messages do
  before do
    @messages = Textmagic::REST::Messages.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete, :price].each do |method|
    it "should have method #{method}" do
      expect(@messages).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@messages.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@messages.instance_variable_get(:@client)).to eq('mockClient')
    expect(@messages.instance_variable_get(:@path)).to eq('mockPath')
  end
end