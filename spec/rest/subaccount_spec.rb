require 'spec_helper'

describe Textmagic::REST::Subaccount do
  before do
    @subaccount = Textmagic::REST::Subaccount.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@subaccount.instance_variable_get(:@client)).to eq('mockClient')
    expect(@subaccount.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@subaccount).to respond_to(method)
    end
  end
end

describe Textmagic::REST::Subaccounts do
  before do
    @subaccounts = Textmagic::REST::Subaccounts.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete, :send_invite].each do |method|
    it "should have method #{method}" do
      expect(@subaccounts).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@subaccounts.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@subaccounts.instance_variable_get(:@client)).to eq('mockClient')
    expect(@subaccounts.instance_variable_get(:@path)).to eq('mockPath')
  end
end