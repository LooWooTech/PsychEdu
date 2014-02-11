class AddDefaultValueForNotesPlayTimePoint < ActiveRecord::Migration
  def up 
    change_column_default :notes, :play_time_point, 0.0
  end

  def down
    change_column_default :notes, :play_time_point, nil
  end
end
