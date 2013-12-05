require 'spec_helper'

describe LearningPeriod do
  subject{FactoryGirl.build :learning_period}

  it_behaves_like 'period'

  context 'when other learning periods were created' do
    before{ @another_learning_period = FactoryGirl.create :learning_period }

    it 'should not intersect with any other learning periods that in the same subject learning' do
      subject.subject_learning = @another_learning_period.subject_learning.reload
      subject.start_on = @another_learning_period.start_on + 1.day
      subject.end_on = subject.start_on + 29.days

      expect(subject).to be_invalid
    end

    it 'can intersect with other learning periods that not in the same subject learning' do
      subject.start_on = @another_learning_period.start_on + 1.day
      subject.end_on = subject.start_on + 29.days

      expect(subject).to be_valid
    end
  end

  describe '#actually_end_on' do
    it 'returns end_on if with no leaving period' do
      expect(subject.actually_end_on).to eq subject.end_on
    end

    context 'with leaving_period' do
      before do
        subject.save

        @leaving_start = subject.start_on
        @leaving_end = @leaving_start + 60.days
        @leaving_duration = @leaving_end - @leaving_start + 1
      end

      it 'returns end_on + the sum of all leaving duration' do
        subject.leave @leaving_start, @leaving_end
        expect(subject.actually_end_on).to eq subject.end_on + @leaving_duration
      end
    end
  end
end
