class AddQuestionerIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :questioner_id, :integer
    add_index :questions, :questioner_id
  end
end
