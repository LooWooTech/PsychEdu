class AddAnswererTypeToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answerer_type, :string
  end
end
