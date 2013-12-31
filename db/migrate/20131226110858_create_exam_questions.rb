class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|
      t.text :content
      t.string :type
      t.references :unit, index: true
      t.references :parent, index: true

      t.timestamps
    end
  end
end
