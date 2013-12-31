class ChoiceAnswer < ExamAnswer
  belongs_to :case_answer, :foreign_key => :parent_id
  has_and_belongs_to_many :choices
end
