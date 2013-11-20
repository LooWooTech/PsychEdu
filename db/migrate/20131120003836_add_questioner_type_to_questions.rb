class AddQuestionerTypeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :questioner_type, :string
  end
end
