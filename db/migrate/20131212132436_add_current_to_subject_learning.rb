class AddCurrentToSubjectLearning < ActiveRecord::Migration
  def change
    add_column :subject_learnings, :current, :boolean, :default => false
  end
end
