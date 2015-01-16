class ChangeChoicesExamAnswersToMultipleChoices < ActiveRecord::Migration
  def up
    remove_index :choices_exam_answers, :column => :exam_answer_id
    remove_index :choices_exam_answers, :column => :choice_id

    rename_column :choices_exam_answers, :exam_answer_id, :multiple_choice_answer_id
    rename_table :choices_exam_answers, :multiple_choices

    add_index :multiple_choices, :multiple_choice_answer_id
    add_index :multiple_choices, :choice_id
  end

  def down
    remove_index :multiple_choices, :column => :multiple_choice_answer_id
    remove_index :multiple_choices, :column => :choice_id

    rename_table :multiple_choices, :choices_exam_answers
    rename_column :choices_exam_answers, :multiple_choice_answer_id, :exam_answer_id

    add_index :choices_exam_answers, :exam_answer_id
    add_index :choices_exam_answers, :choice_id
  end
end
