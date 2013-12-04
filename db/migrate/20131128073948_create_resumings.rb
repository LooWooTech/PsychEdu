class CreateResumings < ActiveRecord::Migration
  def change
    create_table :resumings do |t|
      t.references :leaving_period, index: true
      t.date :date
      t.integer :review_state, :default => 0
      t.references :reviewer, index: true

      t.timestamps
    end
  end
end
