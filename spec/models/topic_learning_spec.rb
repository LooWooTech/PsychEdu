require 'spec_helper'

describe TopicLearning do
  subject{ FactoryGirl.create :topic_learning }

  it_behaves_like 'having unique attribute in scope', :topic, :student
  include_examples 'auto create child learning objects', :chapter_learnings, :for => :chapter, :parent => :topic

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

  describe '#last_exam' do
    it 'returns new TopicExam' do
      expect{subject.last_exam}.to change(TopicExam, :count)
    end

    context 'there is an topic exam' do
      before do
        @topic_exam = FactoryGirl.create(:topic_exam)
        subject.exams << @topic_exam
      end

      context 'which is unsubmitted' do
        it 'returns the unsubmitted topic exam' do
          expect(subject.last_exam).to eq(@topic_exam)
        end
      end

      context 'which is submitted' do
        before do
          @topic_exam.update_attribute :submitted, true
        end

        it 'returns new TopicExam' do
          expect{subject.last_exam}.to change(TopicExam, :count)
        end
      end
    end
  end

end
