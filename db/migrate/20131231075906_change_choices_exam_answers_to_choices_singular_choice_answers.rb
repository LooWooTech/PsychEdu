class ChangeChoicesExamAnswersToChoicesSingularChoiceAnswers < ActiveRecord::Migration
  def up
    rename_column :choices_exam_answers, :exam_answer_id, :singular_choice_answer_id
    rename_table :choices_exam_answers, :choices_singular
  end

  def down
    rename_table :choices_singular, :choices_exam_answers
    rename_column :choices_exam_answers, :singular_choice_answer_id, :exam_answer_id
  end
end
