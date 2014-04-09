require 'spec_helper'

describe Student do
  subject{FactoryGirl.create :student}
  specify {expect(subject).to be_valid}

  it_behaves_like 'requiring attributes', :name, :unit_code
  it_behaves_like 'having an account'

  describe '#current_topic_learning' do
    before do
      FactoryGirl.create_list :topic_learning, 2, :student => subject
      @current_topic_learning = subject.topic_learnings.last
    end

    context 'current topic learning object exists' do
      before do
        @current_topic_learning.update_attribute :current, true
      end

      it 'returns topic_learning object whose current attribute is true' do
        expect(subject.current_topic_learning).to eq(@current_topic_learning)
      end
    end

    context 'no current topic learning' do
      before do
        @earliest_topic_learning = subject.topic_learnings.min{|s| s.created_at.to_i }
      end

      it 'returns the earliest topic learning object' do
        expect(subject.current_topic_learning).to eq(@earliest_topic_learning)
      end
    end
  end

end
