class CreateCaseQuestions < ActiveRecord::Migration
  def change
    create_table :case_questions do |t|
      t.text :content
      t.references :unit, index: true

      t.timestamps
    end
  end
end
