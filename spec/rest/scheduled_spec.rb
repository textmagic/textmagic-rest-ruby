require 'spec_helper'

describe Textmagic::REST::Schedule do
  before do
    @schedule = Textmagic::REST::Schedule.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@schedule.instance_variable_get(:@client)).to eq('mockClient')
    expect(@schedule.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@schedule).to respond_to(method)
    end
  end
end

describe Textmagic::REST::Schedules do
  before do
    @schedules = Textmagic::REST::Schedules.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete].each do |method|
    it "should have method #{method}" do
      expect(@schedules).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@schedules.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError if try to call create method' do
    expect{@schedules.create({})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@schedules.instance_variable_get(:@client)).to eq('mockClient')
    expect(@schedules.instance_variable_get(:@path)).to eq('mockPath')
  end
end