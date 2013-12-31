class ChangeExamQuestionToSingularChoiceQuestion < ActiveRecord::Migration
  def up
    remove_column :exam_questions, :type
    rename_column :exam_questions, :parent_id, :case_question_id
    rename_table :exam_questions, :singular_choice_questions
  end

  def down
    rename_table :singular_choice_questions, :exam_questions
    add_column :exam_questions, :type, :string
    rename_column :exam_questions, :case_question_id, :parent_id
  end
end
