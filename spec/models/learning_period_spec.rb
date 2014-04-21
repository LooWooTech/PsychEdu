require 'spec_helper'

describe LearningPeriod do

  before do
    @topic_learning = FactoryGirl.create :topic_learning
  end

  subject{ FactoryGirl.build :learning_period, :topic_learning => @topic_learning }

  it_behaves_like 'period'

  context 'when other learning periods were created' do
    before do
      @another_topic_learning = FactoryGirl.create :topic_learning
      @another_learning_period = FactoryGirl.create :learning_period, :topic_learning => @another_topic_learning
    end

    it 'should not intersect with any other learning periods that in the same topic learning' do
      subject.topic_learning = @another_topic_learning
      subject.start_on = @another_learning_period.start_on + 1.day
      subject.end_on = subject.start_on + 29.days

      expect(subject).to be_invalid
    end

    it 'can intersect with other learning periods that not in the same topic learning' do
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
        @leave_period = subject.leave @leaving_start, @leaving_end
      end

      it 'returns end_on + sum of all leaving duration' do
        @leave_period.accepted!
        expect(subject.actually_end_on).to eq subject.end_on + @leaving_duration
      end

      it 'returns end_on if the review state of leaving period is not accepted' do
        @leave_period.unreviewed!
        expect(subject.actually_end_on).to eq subject.end_on
      end
    end
  end
end
