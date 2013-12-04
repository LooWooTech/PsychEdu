class CreateLearningPeriods < ActiveRecord::Migration
  def change
    create_table :learning_periods do |t|
      t.references :course_learning, index: true
      t.date :start_on
      t.date :end_on
      t.integer :review_state, :default => 0
      t.references :reviewer, index: true

      t.timestamps
    end
  end
end
