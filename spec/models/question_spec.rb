require 'spec_helper'

describe Question do
  before :each do
    @question = FactoryGirl.build :question
  end

  specify { expect(@question).to be_valid }

  specify 'title should exist' do
    @question.title = ''
    expect(@question).to be_invalid
  end

  specify 'title should have 1 ~ 140 words' do
    @question.title = "this is a very very very lo#{'o' * 140}ng title"
    expect(@question).to be_invalid
  end

  specify 'content should exist' do
    @question.content = ''
    expect(@question).to be_invalid
  end

  describe '#destroy' do
    specify 'all answers to this question should be destroyed'
  end
end
