require 'spec_helper'

describe SubjectLearning do
  subject{ FactoryGirl.create :subject_learning }

  before do
    @learning_start = Date.parse('2013-01-01')
    @learning_end = Date.parse('2013-01-31')
    subject.start @learning_start, @learning_end
  end

  describe '#ongoing?' do
    it 'returns true if the date is during learning period' do
      expect(subject).to be_ongoing @learning_start
    end

    it 'returns false if the date is out of learning period' do
      expect(subject).not_to be_ongoing @learning_end + 1.day
    end

    context 'when student asked for leave' do
      before do
        @leave_start = @learning_start + 5.days
        @leave_end = @leave_start + 29.days
        subject.ask_for_leave @leave_start, @leave_end
      end

      it 'returns false if the date is during leaving period' do
        expect(subject).not_to be_ongoing @leave_start
      end
    end
  end

  describe '#leaving?' do
    before do
      @leave_start = @learning_start + 5.days
      @leave_end = @leave_start + 29.days
      subject.ask_for_leave @leave_start, @leave_end
    end

    it 'returns true if the date is during leaving period' do
      expect(subject).to be_leaving @leave_start
    end

    it 'returns false if the date is out of leaving period' do
      expect(subject).not_to be_leaving @leave_start - 1.day
    end
  end

end
