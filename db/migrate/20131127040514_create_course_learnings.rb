class CreateCourseLearnings < ActiveRecord::Migration
  def change
    create_table :course_learnings do |t|
      t.references :student, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end
