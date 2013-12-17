class CreateVideoWatchings < ActiveRecord::Migration
  def change
    create_table :video_watchings do |t|
      t.references :unit_learning, index: true
      t.references :video, index: true
      t.float :last_end_at, :default => 0.0
      t.integer :play_times, :default => 0

      t.timestamps
    end
  end
end
