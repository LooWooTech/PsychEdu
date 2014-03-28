class CreateMonthlyOnlineTrackings < ActiveRecord::Migration
  def change
    create_table :monthly_online_trackings do |t|
      t.references :topic_learning, index: true
      t.integer :seconds, :default => 0

      t.timestamps
    end
  end
end
