require 'spec_helper'

describe LeavingPeriod do
  subject{FactoryGirl.build :leaving_period }
  it_behaves_like 'period'

  it 'should not start out of any learning period' do
    subject.start_on = subject.learning_period.end_on + 1.day
    subject.end_on = subject.start_on + 29.days
    expect(subject).to be_invalid
  end

  it 'should start during learning period' do
    subject.start_on = subject.learning_period.end_on
    subject.end_on = subject.start_on + 29.days
    expect(subject).to be_valid
  end

  describe '#actually_end_on' do
    it 'returns end_on date' do
      expect(subject.actually_end_on).to be_equal subject.end_on
    end

    it 'returns resuming date if it was resumed' do
      resuming_date = subject.start_on + 5.days
      subject.resume resuming_date
      expect(subject.actually_end_on).to be_equal resuming_date
    end
  end
end
