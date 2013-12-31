class AddUnitExamToMultipleChoiceAnswers < ActiveRecord::Migration
  def change
    add_reference :multiple_choice_answers, :unit_exam, index: true
  end
end
