require 'spec_helper'

describe Textmagic::REST::InstanceResource do

  it 'should set up path and client' do
    resource = Textmagic::REST::InstanceResource.new('mock/path', 'mockClient')
    expect(resource.instance_variable_get('@path')).to eq('mock/path')
    expect(resource.instance_variable_get('@client')).to eq('mockClient')
  end

  it 'should set up instance properties if passed' do
    params = { :firstName => 'James' }
    resource = Textmagic::REST::InstanceResource.new('path', 'client', params)
    expect(resource.first_name).to eq('James')
  end

end