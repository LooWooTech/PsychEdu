require 'spec_helper'

describe MultipleChoiceAnswer do
  subject{ FactoryGirl.create :multiple_choice_answer }

  describe "#correct?" do
    before do
      @question = FactoryGirl.create :multiple_choice_question
      @correct_choices = FactoryGirl.create_list :correct_choice, 2, :choice_question => @question
      @wrong_choices = FactoryGirl.create_list :choice, 2, :choice_question => @question
      subject.update_attribute :question, @question
    end

    context 'all correct choices were selected' do
      before do
        subject.choices << @correct_choices
      end

      it "returns true" do
        expect(subject.correct?).to be_true
      end

      it "returns false if any wrong choice was selected" do
        subject.choices << @wrong_choices
        expect(subject.correct?).to be_false
      end
    end

    it "returns false if any correct choice was not selected" do
      expect(subject.correct?).to be_false
    end
  end
end
