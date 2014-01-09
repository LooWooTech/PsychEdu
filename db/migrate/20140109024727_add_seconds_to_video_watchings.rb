class AddSecondsToVideoWatchings < ActiveRecord::Migration
  def change
    add_column :video_watchings, :seconds, :float, :default => 0.0
  end
end
