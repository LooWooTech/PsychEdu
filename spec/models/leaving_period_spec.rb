require 'spec_helper'

describe LeavingPeriod do
  subject{FactoryGirl.create :leaving_period }
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
      expect(subject.actually_end_on).to eq subject.end_on
    end

    it 'returns the earliest resuming date if it was resumed' do
      earlier_date = subject.start_on + 5.days
      later_date = subject.start_on + 6.days
      subject.resume later_date
      subject.resume earlier_date
      expect(subject.actually_end_on).to eq earlier_date
    end
  end
end
