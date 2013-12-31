class CreateChoicesExamAnswers < ActiveRecord::Migration
  def change
    create_table :choices_exam_answers do |t|
      t.references :choice, :index => true
      t.references :exam_answer, :index => true
    end
  end
end
