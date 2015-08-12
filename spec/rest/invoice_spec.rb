require 'spec_helper'

describe Textmagic::REST::Invoice do
  before do
    @invoice = Textmagic::REST::Invoice.new 'mockPath', 'mockClient'
  end

  it 'sets up a client and path' do
    expect(@invoice.instance_variable_get(:@client)).to eq('mockClient')
    expect(@invoice.instance_variable_get(:@path)).to eq('mockPath')
  end

  [:refresh].each do |method|
    it "should have method #{method}" do
      expect(@invoice).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call refresh method' do
    expect{@invoice.refresh}.to raise_error(RuntimeError)
  end

end

describe Textmagic::REST::Invoices do
  before do
    @invoices = Textmagic::REST::Invoices.new 'mockPath', 'mockClient'
  end

  [:list, :get, :update, :create, :delete].each do |method|
    it "should have method #{method}" do
      expect(@invoices).to respond_to(method)
    end
  end

  it 'should raise RuntimeError if try to call update method' do
    expect{@invoices.update(1, {})}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError if try to call delete method' do
    expect{@invoices.delete(1)}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError if try to call get method' do
    expect{@invoices.get(1)}.to raise_error(RuntimeError)
  end

  it 'should raise RuntimeError if try to call create method' do
    expect{@invoices.create({})}.to raise_error(RuntimeError)
  end

  it 'sets up a client and path' do
    expect(@invoices.instance_variable_get(:@client)).to eq('mockClient')
    expect(@invoices.instance_variable_get(:@path)).to eq('mockPath')
  end
end