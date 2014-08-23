class Remove < ActiveRecord::Migration
  def up
    drop_table :images
  end

  def down
    create_table :images do |t|
      t.string :file
      t.references :uploader, index: true

      t.timestamps
    end
  end
end
