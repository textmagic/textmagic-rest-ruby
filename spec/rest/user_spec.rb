require 'spec_helper'

describe Textmagic::REST::User do
  before do
    @user = Textmagic::REST::User.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@user.instance_variable_get(:@client)).to eq('mockClient')
    expect(@user.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@user).to respond_to(method)
    end
  end

end

describe Textmagic::REST::Source do
  before do
    @source = Textmagic::REST::Source.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@source.instance_variable_get(:@client)).to eq('mockClient')
    expect(@source.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@source).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call refresh method' do
    expect{@source.refresh}.to raise_error(RuntimeError)
  end
end


describe Textmagic::REST::SpendingStat do
  before do
    @stat = Textmagic::REST::SpendingStat.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@stat.instance_variable_get(:@client)).to eq('mockClient')
    expect(@stat.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@stat).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call refresh method' do
    expect{@stat.refresh}.to raise_error(RuntimeError)
  end
end

describe Textmagic::REST::Users do
  before do
    @users = Textmagic::REST::Users.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete, :messaging_stat, :spending_stat, :sources].each do |method|
    it "should have method #{method}" do
      expect(@users).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call delete method' do
    expect{@users.delete(1)}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError if try to call create method' do
    expect{@users.create({})}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError if try to call list method' do
    expect{@users.list}.to raise_error(RuntimeError)
  end


  it 'sets up a client and path' do
    expect(@users.instance_variable_get(:@client)).to eq('mockClient')
    expect(@users.instance_variable_get(:@path)).to eq('mockPat')
  end
end