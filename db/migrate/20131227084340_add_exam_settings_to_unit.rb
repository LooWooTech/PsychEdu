class AddExamSettingsToUnit < ActiveRecord::Migration
  def change
    add_column :units, :singular_choice_count, :integer, :default => 0
    add_column :units, :multiple_choice_count, :integer, :default => 0
    add_column :units, :case_count, :integer, :default => 0
    add_column :units, :question_repository_file, :string
  end
end
