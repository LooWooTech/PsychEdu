class RecreateCourseLearning < ActiveRecord::Migration
  def change
    create_table :course_learnings do |t|
      t.references :subject_learning, index: true
      t.references :course, index: true
      t.integer :minutes, :default => 0

      t.timestamps
    end
  end
end
