require 'spec_helper'

describe Textmagic::REST::Session do
  before do
    @session = Textmagic::REST::Session.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@session.instance_variable_get(:@client)).to eq('mockClient')
    expect(@session.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@session).to respond_to(method)
    end
  end
end

describe Textmagic::REST::Sessions do
  before do
    @sessions = Textmagic::REST::Sessions.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete, :messages].each do |method|
    it "should have method #{method}" do
      expect(@sessions).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@sessions.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError if try to call create method' do
    expect{@sessions.create({})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@sessions.instance_variable_get(:@client)).to eq('mockClient')
    expect(@sessions.instance_variable_get(:@path)).to eq('mockPath')
  end
end