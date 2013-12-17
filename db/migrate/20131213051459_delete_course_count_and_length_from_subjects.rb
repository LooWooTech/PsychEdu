class DeleteCourseCountAndLengthFromSubjects < ActiveRecord::Migration
  def up
    remove_column :subjects, :course_count
    remove_column :subjects, :length
  end

  def down
    add_column :subjects, :course_count, :integer, :default => 0
    add_column :subjects, :length, :float, :default => 0.0
  end
end
