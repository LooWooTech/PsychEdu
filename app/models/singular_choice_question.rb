class SingularChoiceQuestion < ActiveRecord::Base
  include ChoiceQuestion

  def correct_choice
    choices.correct.first
  end
end
