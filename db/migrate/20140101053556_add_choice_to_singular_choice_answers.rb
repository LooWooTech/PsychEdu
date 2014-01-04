class AddChoiceToSingularChoiceAnswers < ActiveRecord::Migration
  def change
    add_reference :singular_choice_answers, :choice, index: true
  end
end
