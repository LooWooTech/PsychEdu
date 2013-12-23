require 'spec_helper'

describe Student do
  subject{FactoryGirl.create :student}
  specify {expect(subject).to be_valid}

  it_behaves_like 'requiring attributes', :name, :gender, :unit_code
  it_behaves_like 'having an account'

  describe '#current_subject_learning' do
    before do
      FactoryGirl.create_list :subject_learning, 2, :student => subject
      @current_subject_learning = subject.subject_learnings.last
    end

    context 'current subject learning object exists' do
      before do
        @current_subject_learning.update_attribute :current, true
      end

      it 'returns subject_learning object whose current attribute is true' do
        expect(subject.current_subject_learning).to eq(@current_subject_learning)
      end
    end

    context 'no current subject learning' do
      before do
        @earliest_subject_learning = subject.subject_learnings.min{|s| s.created_at.to_i }
      end

      it 'returns the earliest subject learning object' do
        expect(subject.current_subject_learning).to eq(@earliest_subject_learning)
      end
    end
  end

end
