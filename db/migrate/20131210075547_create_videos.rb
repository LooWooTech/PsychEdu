class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :interaction_file
      t.string :teacher_names
      t.references :chapter, index: true

      t.timestamps
    end
  end
end
