require 'spec_helper'

describe Textmagic::REST::CustomField do
  before do
    @custom_field = Textmagic::REST::CustomField.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@custom_field.instance_variable_get(:@client)).to eq('mockClient')
    expect(@custom_field.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@custom_field).to respond_to(method)
    end
  end

end

describe Textmagic::REST::CustomFields do
  before do
    @custom_fields = Textmagic::REST::CustomFields.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete, :update_value].each do |method|
    it "should have method #{method}" do
      expect(@custom_fields).to respond_to(method)
    end
  end

  it 'sets up a client and path' do
    expect(@custom_fields.instance_variable_get(:@client)).to eq('mockClient')
    expect(@custom_fields.instance_variable_get(:@path)).to eq('mockPath')
  end
end