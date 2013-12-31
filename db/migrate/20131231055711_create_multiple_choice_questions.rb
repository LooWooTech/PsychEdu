class CreateMultipleChoiceQuestions < ActiveRecord::Migration
  def change
    create_table :multiple_choice_questions do |t|
      t.text :content
      t.references :unit, index: true
      t.references :case_question, index: true

      t.timestamps
    end
  end
end
