require 'spec_helper'

describe CourseLearning do
  subject{ FactoryGirl.create :course_learning }

  include_examples 'auto create child learning objects', :unit_learnings, :for => :unit, :parent => :course

  describe '#open?' do
    context 'first course learning' do
      before{ subject.course.move_to_top }
      its(:open?){ should be_true}
    end

    context 'non-first course learning' do
      before do
        @the_course = subject.course
        @subject = FactoryGirl.create :subject
        @subject.courses << [@the_course, FactoryGirl.create(:course)]
        @the_course.move_to_bottom
      end

      context 'the one in front of it is passed' do
        before{ pending }
        its(:open?){ should be_true }
      end

      context 'the one in front of it is not passed' do
        before{ pending }
        its(:open?){ should be_false }
      end
    end
  end

end
