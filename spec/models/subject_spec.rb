require 'spec_helper'

describe Subject do
  subject{ FactoryGirl.create :subject }
  it_behaves_like 'having unique attributes', :name
  it_behaves_like 'requiring attributes', :name

  context 'has some subject learnings' do
    before do
      @subject_learning = FactoryGirl.create :subject_learning, :subject => subject
    end

    it 'creates course learnings for each subject learning after adding course' do
      new_course = FactoryGirl.create :course, :subject => nil
      subject.courses << new_course
      subject.subject_learnings.each do |subject_learning|
        expect(subject_learning.course_learnings.find_by(:course => new_course)).not_to be_nil
      end
    end
  end
end
