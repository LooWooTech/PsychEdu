class AddReviewVideoUrlToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :review_video_url, :string
  end
end
