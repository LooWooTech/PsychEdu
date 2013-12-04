class CreateLeavingPeriods < ActiveRecord::Migration
  def change
    create_table :leaving_periods do |t|
      t.references :learning_period, index: true
      t.date :start_on
      t.date :end_on
      t.integer :review_state, :default => 0
      t.references :reviewer, index: true

      t.timestamps
    end
  end
end
