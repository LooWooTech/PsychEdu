class MultipleChoiceAnswer < ActiveRecord::Base
  include ChoiceAnswer
  belongs_to :question, :class_name => 'MultipleChoiceQuestion', :foreign_key => :multiple_choice_question_id
  has_and_belongs_to_many :choices, :join_table => :multiple_choices

  def correct?
    choices == question.correct_choices
  end
end
