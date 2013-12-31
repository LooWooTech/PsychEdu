class CreateExamAnswers < ActiveRecord::Migration
  def change
    create_table :exam_answers do |t|
      t.references :exam_question, index: true
      t.references :parent, index: true
      t.string :type

      t.timestamps
    end
  end
end
