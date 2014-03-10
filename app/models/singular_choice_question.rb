class SingularChoiceQuestion < ActiveRecord::Base
  include ChoiceQuestion
  has_many :answers, :class_name => 'SingularChoiceAnswer', :dependent => :destroy

  def correct_choice
    choices.correct.first
  end
end
