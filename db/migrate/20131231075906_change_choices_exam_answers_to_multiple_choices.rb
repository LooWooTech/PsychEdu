class ChangeChoicesExamAnswersToMultipleChoices < ActiveRecord::Migration
  def up
    rename_column :choices_exam_answers, :exam_answer_id, :multiple_choice_answer_id
    rename_table :choices_exam_answers, :multiple_choices
  end

  def down
    rename_table :multiple_choices, :choices_exam_answers
    rename_column :choices_exam_answers, :multiple_choice_answer_id, :exam_answer_id
  end
end
