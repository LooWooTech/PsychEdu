require 'spec_helper'

describe SingularChoiceAnswer do
  subject{ FactoryGirl.create :singular_choice_answer }

  describe "#correct?" do
    before do
      @question = FactoryGirl.create :singular_choice_question
      @correct_choice = FactoryGirl.create :correct_choice, :choice_question => @question
      @wrong_choices = FactoryGirl.create_list :choice, 3, :choice_question => @question
    end

    it "returns false if no choice was selected" do
      expect(subject.correct?).to be_false
    end

    it "returns false if wrong choice was selected" do
      subject.choice = @wrong_choices.first
      expect(subject.correct?).to be_false
    end

    it "returns true if correct choice was selected" do
      subject.choice = @correct_choice
      expect(subject.correct?).to be_true
    end
  end
end
