class CreateUnitLearnings < ActiveRecord::Migration
  def change
    create_table :unit_learnings do |t|
      t.references :course_learning, index: true
      t.references :unit, index: true

      t.timestamps
    end
  end
end
