require 'spec_helper'

describe Textmagic::REST::Template do
  before do
    @template = Textmagic::REST::Template.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@template.instance_variable_get(:@client)).to eq('mockClient')
    expect(@template.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@template).to respond_to(method)
    end
  end

end

describe Textmagic::REST::Templates do
  before do
    @templates = Textmagic::REST::Templates.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete].each do |method|
    it "should have method #{method}" do
      expect(@templates).to respond_to(method)
    end
  end

  it 'sets up a client and path' do
    expect(@templates.instance_variable_get(:@client)).to eq('mockClient')
    expect(@templates.instance_variable_get(:@path)).to eq('mockPath')
  end
end