class AddAnswererIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answerer_id, :integer
  end
end
