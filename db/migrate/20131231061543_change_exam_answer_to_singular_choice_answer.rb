class ChangeExamAnswerToSingularChoiceAnswer < ActiveRecord::Migration
  def up
    rename_column :exam_answers, :exam_question_id, :singular_choice_question_id
    rename_column :exam_answers, :parent_id, :case_answer_id
    remove_column :exam_answers, :type
    rename_table :exam_answers, :singular_choice_answers
  end

  def down
    rename_table :singular_choice_answers, :exam_answers
    rename_column :exam_answers, :singular_choice_question_id, :exam_question_id
    rename_column :exam_answers, :case_answer_id, :parent_id
    add_column :exam_answers, :type, :string
  end
end
