class AddAnswererIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answerer_id, :integer
    add_index :answers, :answerer_id
  end
end
