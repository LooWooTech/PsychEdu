class AddUnitExamToSingularChoiceAnswers < ActiveRecord::Migration
  def change
    add_reference :singular_choice_answers, :unit_exam, index: true
  end
end
