class MultipleChoiceQuestion < ActiveRecord::Base
  include ChoiceQuestion
  has_many :answers, :class_name => 'MultipleChoiceAnswer', :dependent => :destroy

  def correct_choices
    choices.correct
  end
end
