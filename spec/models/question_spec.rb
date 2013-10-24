require 'spec_helper'

describe Question do
  before :each do
    @question = FactoryGirl.build :question
  end

  specify 'valid' do
    expect(@question).to be_valid
  end

  specify 'title should be present' do
    @question.title = ''
    expect(@question).to be_invalid
  end

  specify 'title should have 1 ~ 140 words' do
    @question.title = "this is a very very very lo#{'o' * 140}ng title"
    expect(@question).to be_invalid
  end

  specify 'content should be present' do
    @question.content = ''
    expect(@question).to be_invalid
  end

  describe '#destroy' do
    specify 'only unreplied question can be destroyed by common user'
    specify 'admin can destroy any question'
  end
end
