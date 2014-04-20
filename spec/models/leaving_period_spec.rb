require 'spec_helper'

describe LeavingPeriod do
  subject{ 
    FactoryGirl.create :leaving_period,
      :start_on => @learning_period.start_on + 1.day,
      :end_on => @learning_period.start_on + 30.days,
      :learning_period => @learning_period,
      :topic_learning => @topic_learning
  }

  it_behaves_like 'period'

  before do
    @topic_learning = FactoryGirl.create :topic_learning
    @learning_period = FactoryGirl.create :learning_period, :topic_learning => @topic_learning
  end

  it 'should not start out of any learning period' do
    subject.start_on = @learning_period.end_on + 1.day
    subject.end_on = subject.start_on + 29.days
    expect(subject).to be_invalid
  end

  it 'should start during learning period' do
    subject.start_on = @learning_period.end_on
    subject.end_on = subject.start_on + 29.days
    expect(subject).to be_valid
  end

  describe '#actually_end_on' do
    it 'returns end_on date' do
      expect(subject.actually_end_on).to eq subject.end_on
    end

    it 'returns the earliest resuming date if it was resumed' do
      earlier_date = subject.start_on + 5.days
      later_date = subject.start_on + 6.days
      @topic_learning.reload.resume later_date
      @topic_learning.reload.resume earlier_date
      expect(subject.actually_end_on).to eq earlier_date
    end
  end
end
