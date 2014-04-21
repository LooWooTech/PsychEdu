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
    period_out_of_range = FactoryGirl.build :leaving_period,
      :start_on => @learning_period.end_on + 1.day,
      :end_on => @learning_period.end_on + 30.days,
      :topic_learning => @topic_learning,
      :learning_period => @learning_period
    expect(period_out_of_range).to be_invalid
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

    context 'with resuming' do
      context 'all accepted' do
        before do
          earlier_date = subject.start_on + 5.days
          later_date = subject.start_on + 6.days
          @later_resuming = @topic_learning.reload.resume later_date
          @earlier_resuming = @topic_learning.reload.resume earlier_date
          @later_resuming.accepted!
          @earlier_resuming.accepted!
        end

        it 'returns the day before the earliest resuming date if it was resumed' do
          expect(subject.actually_end_on).to eq @earlier_resuming.start_on.yesterday
        end
      end

      context 'the review state of the earliest resuming is not accepted' do
        before do
          earlier_date = subject.start_on + 5.days
          later_date = subject.start_on + 6.days
          @later_resuming = @topic_learning.reload.resume later_date
          @earlier_resuming = @topic_learning.reload.resume earlier_date
          @later_resuming.accepted!
        end

        it 'returns the day before the second earliest resuming date' do
          @earlier_resuming.rejected!
          expect(subject.actually_end_on).to eq @later_resuming.start_on.yesterday
        end
      end
    end
  end
end
