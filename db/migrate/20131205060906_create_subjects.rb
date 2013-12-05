class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :introduction
      t.string :teacher_names
      t.integer :course_count, :default => 0
      t.float :length, :default => 0.0

      t.timestamps
    end
  end
end
