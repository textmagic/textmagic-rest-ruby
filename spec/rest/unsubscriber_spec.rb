require 'spec_helper'

describe Textmagic::REST::Unsubscriber do
  before do
    @unsubscriber = Textmagic::REST::Unsubscriber.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@unsubscriber.instance_variable_get(:@client)).to eq('mockClient')
    expect(@unsubscriber.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@unsubscriber).to respond_to(method)
    end
  end

end

describe Textmagic::REST::Unsubscribers do
  before do
    @unsubscribers = Textmagic::REST::Unsubscribers.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete].each do |method|
    it "should have method #{method}" do
      expect(@unsubscribers).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@unsubscribers.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@unsubscribers.instance_variable_get(:@client)).to eq('mockClient')
    expect(@unsubscribers.instance_variable_get(:@path)).to eq('mockPath')
  end
end