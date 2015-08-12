require 'spec_helper'

describe Textmagic::REST::Reply do
  before do
    @reply = Textmagic::REST::Reply.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@reply.instance_variable_get(:@client)).to eq('mockClient')
    expect(@reply.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@reply).to respond_to(method)
    end
  end
end

describe Textmagic::REST::Replies do
  before do
    @replies = Textmagic::REST::Replies.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete].each do |method|
    it "should have method #{method}" do
      expect(@replies).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@replies.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError if try to call create method' do
    expect{@replies.create({})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@replies.instance_variable_get(:@client)).to eq('mockClient')
    expect(@replies.instance_variable_get(:@path)).to eq('mockPath')
  end
end