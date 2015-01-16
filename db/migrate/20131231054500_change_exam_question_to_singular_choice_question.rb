class ChangeExamQuestionToSingularChoiceQuestion < ActiveRecord::Migration
  def up
    remove_index :exam_questions, :column => :parent_id
    remove_index :exam_questions, :column => :unit_id

    remove_column :exam_questions, :type
    rename_column :exam_questions, :parent_id, :case_question_id
    rename_table :exam_questions, :singular_choice_questions

    add_index :singular_choice_questions, :case_question_id
    add_index :singular_choice_questions, :unit_id
  end

  def down
    remove_index :singular_choice_questions, :column => :case_question_id
    remove_index :singular_choice_questions, :column => :unit_id

    rename_table :singular_choice_questions, :exam_questions
    add_column :exam_questions, :type, :string
    rename_column :exam_questions, :case_question_id, :parent_id

    add_index :exam_questions, :parent_id
    add_index :exam_questions, :unit_id
  end
end
