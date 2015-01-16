class ChangeExamAnswerToSingularChoiceAnswer < ActiveRecord::Migration
  def up
    remove_index :exam_answers, :column => :exam_question_id
    remove_index :exam_answers, :column => :parent_id

    rename_column :exam_answers, :exam_question_id, :singular_choice_question_id
    rename_column :exam_answers, :parent_id, :case_answer_id
    remove_column :exam_answers, :type
    rename_table :exam_answers, :singular_choice_answers

    add_index :singular_choice_answers, :singular_choice_question_id
    add_index :singular_choice_answers, :case_answer_id

  end

  def down
    remove_index :singular_choice_answers, :column => :singular_choice_question_id
    remove_index :singular_choice_answers, :column => :case_answer_id

    rename_table :singular_choice_answers, :exam_answers
    rename_column :exam_answers, :singular_choice_question_id, :exam_question_id
    rename_column :exam_answers, :case_answer_id, :parent_id
    add_column :exam_answers, :type, :string

    add_index :exam_answers, :exam_question_id
    add_index :exam_answers, :parent_id
  end
end
