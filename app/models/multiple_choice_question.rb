class MultipleChoiceQuestion < ActiveRecord::Base
  include ChoiceQuestion

  def correct_choices
    choices.correct
  end
end
