class CaseQuestion < TestingQuestion
  has_many :choice_questions, :dependent => :destroy
end
