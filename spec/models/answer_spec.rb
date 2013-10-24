require 'spec_helper'

describe Answer do
  before :each do
    @answer = FactoryGirl.build :answer
  end

  specify 'valid' do
    expect(@answer).to be_valid
  end

  specify 'content should exist' do
    @answer.content = ''
    expect(@answer).to be_invalid
  end
end
