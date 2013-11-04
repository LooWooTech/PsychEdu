class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.text :content
      t.references :complainable, index: true
      t.string :complainable_type
      t.references :complainer, index: true

      t.timestamps
    end
  end
end
