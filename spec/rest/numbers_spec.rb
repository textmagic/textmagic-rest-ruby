require 'spec_helper'

describe Textmagic::REST::Number do
  before do
    @number = Textmagic::REST::Number.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@number.instance_variable_get(:@client)).to eq('mockClient')
    expect(@number.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@number).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call refresh method' do
    expect{@number.refresh}.to raise_error(RuntimeError)
  end

end

describe Textmagic::REST::AvailableNumber do
  before do
    @number = Textmagic::REST::AvailableNumber.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@number.instance_variable_get(:@client)).to eq('mockClient')
    expect(@number.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@number).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call refresh method' do
    expect{@number.refresh}.to raise_error(RuntimeError)
  end

end

describe Textmagic::REST::Numbers do
  before do
    @numbers = Textmagic::REST::Numbers.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :buy, :delete, :available].each do |method|
    it "should have method #{method}" do
      expect(@numbers).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@numbers.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@numbers.instance_variable_get(:@client)).to eq('mockClient')
    expect(@numbers.instance_variable_get(:@path)).to eq('mockPath')
  end
end