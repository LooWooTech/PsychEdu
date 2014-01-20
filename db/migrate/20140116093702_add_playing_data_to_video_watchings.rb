class AddPlayingDataToVideoWatchings < ActiveRecord::Migration
  def change
    add_column :video_watchings, :playing_data, :text
  end
end
