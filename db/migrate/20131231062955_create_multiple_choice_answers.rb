class CreateMultipleChoiceAnswers < ActiveRecord::Migration
  def change
    create_table :multiple_choice_answers do |t|
      t.references :multiple_choice_question, index: true
      t.references :case_answer, index: true

      t.timestamps
    end
  end
end
