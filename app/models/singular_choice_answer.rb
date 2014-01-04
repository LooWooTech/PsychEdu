class SingularChoiceAnswer < ActiveRecord::Base
  include ChoiceAnswer
  belongs_to :question, :class_name => 'SingularChoiceQuestion', :foreign_key => :singular_choice_question_id
  belongs_to :choice

  def correct?
    choice && choice.correct?
  end
end
