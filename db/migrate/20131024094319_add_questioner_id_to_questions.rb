class AddQuestionerIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :questioner_id, :integer
  end
end
