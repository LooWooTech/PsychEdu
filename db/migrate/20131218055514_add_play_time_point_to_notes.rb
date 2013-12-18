class AddPlayTimePointToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :play_time_point, :float
  end
end
