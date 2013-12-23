require 'spec_helper'

describe CourseLearning do
  subject{ FactoryGirl.create :course_learning }

  it_behaves_like 'composing with model that have the same parent object', :subject_learning, :subject

  it 'has unique course with the same subject_learning' do
    expect(FactoryGirl.build :course_learning, :course => subject.course, :subject_learning => subject.subject_learning).to be_invalid
  end

  it 'could have the same course without same subject_learning' do
    expect(FactoryGirl.build :course_learning, :course => subject.course, :subject_learning => FactoryGirl.create(:subject_learning, :subject => subject.subject)).to be_valid
  end

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
