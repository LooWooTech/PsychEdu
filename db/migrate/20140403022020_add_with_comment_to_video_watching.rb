class AddWithCommentToVideoWatching < ActiveRecord::Migration
  def change
    add_column :video_watchings, :with_comment, :boolean, :default => true
  end
end
