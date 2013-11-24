require 'spec_helper'

describe Question do
  subject{ FactoryGirl.build :question }

  specify { expect(subject).to be_valid }

  it_behaves_like 'requiring attributes', :title, :content

  specify 'title should have 1 ~ 140 words' do
    subject.title = "this is a very very very lo#{'o' * 140}ng title"
    expect(subject).to be_invalid
  end

  describe '#destroy' do
    specify 'all answers to this question should be destroyed'
  end
end
