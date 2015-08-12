require 'spec_helper'

class Util
  include Textmagic::REST::Utils
end

describe Util do
  subject(:util) {Util.new}

  it 'should convert a string to camel case' do
    expect(util.to_camel_case('first_name')).to eq('FirstName')
  end

  it 'should convert hash keys to camel case' do
    underscore = {
        :first_name => 'James',
        :last_name => 'Smith'
    }
    camel_case = {
        :FirstName => 'James',
        :LastName => 'Smith'
    }
    expect(util.to_camel_case(underscore)).to eq(camel_case)
  end

  it 'should convert a string to camel case without capitalize' do
    expect(util.to_camel_case('first_name', false)).to eq('firstName')
  end

  it 'should convert hash keys to camel case without capitalize' do
    underscore = {
        :first_name => 'James',
        :last_name => 'Smith'
    }
    camel_case = {
        :firstName => 'James',
        :lastName => 'Smith'
    }
    expect(util.to_camel_case(underscore, false)).to eq(camel_case)
  end

  it 'should convert a string to underscore case' do
    expect(util.to_underscore_case('firstName')).to eq('first_name')
  end

  it 'should convert hash keys to underscore case' do
    camel_case = {
        :FirstName => 'James',
        :LastName => 'Smith'
    }
    underscore = {
        :first_name => 'James',
        :last_name => 'Smith'
    }
    expect(util.to_underscore_case(camel_case)).to eq(underscore)
  end
end