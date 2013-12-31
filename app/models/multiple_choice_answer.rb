class MultipleChoiceAnswer < ActiveRecord::Base
  belongs_to :case_answer
  belongs_to :question, :class_name => 'MultipleChoiceQuestion', :foreign_key => :multiple_choice_question_id
  belongs_to :unit_exam
  has_and_belongs_to_many :choices, :join_table => :choices_multiple
end
