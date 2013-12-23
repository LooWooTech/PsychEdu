require 'spec_helper'

describe SubjectLearning do
  subject{ FactoryGirl.create :subject_learning }

  it_behaves_like 'having unique attribute in scope', :subject, :student

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

  context "subject has many courses" do
    before do
      @subject = FactoryGirl.create :subject
      FactoryGirl.create_list :course, 5, :subject => @subject
      @subject_learning = FactoryGirl.create :subject_learning, :subject => @subject
    end

    it "creates course_learning for each course in the subject after creating" do
      @subject.courses.each do |course|
        expect(CourseLearning.find_by(:course => course, :subject_learning => @subject_learning)).not_to be_nil
      end
    end
  end
end
