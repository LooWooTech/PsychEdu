class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.references :course, index: true

      t.timestamps
    end
  end
end
