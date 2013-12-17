class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :video_watching, index: true
      t.text :content

      t.timestamps
    end
  end
end
