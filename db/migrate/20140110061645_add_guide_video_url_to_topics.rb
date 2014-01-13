class AddGuideVideoUrlToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :guide_video_url, :string
  end
end
