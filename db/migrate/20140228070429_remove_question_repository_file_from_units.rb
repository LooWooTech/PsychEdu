class RemoveQuestionRepositoryFileFromUnits < ActiveRecord::Migration
  def up
    remove_column :units, :question_repository_file
  end

  def down
    add_column :units, :question_repository_file, :string
  end
end
