class UnitExam < ActiveRecord::Base
  belongs_to :unit_learning
  has_many :singular_choice_answers, :dependent => :destroy
  has_many :multiple_choice_answers, :dependent => :destroy

  after_create :generate_empty_answers

  private

  def generate_empty_answers
    unit_learning.random_singular_choice_questions{|question| singular_choice_answers.create :question => question }
    unit_learning.random_multiple_choice_questions{|question| multiple_choice_answers.create :question => question }
  end

end
