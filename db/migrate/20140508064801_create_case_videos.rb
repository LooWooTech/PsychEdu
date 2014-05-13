class CreateCaseVideos < ActiveRecord::Migration
  def change
    create_table :case_videos do |t|
      t.string :name
      t.string :url
      t.references :case_analysis, index: true

      t.timestamps
    end
  end
end
