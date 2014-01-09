class AddDefaultValueToVideosDuration < ActiveRecord::Migration
  def up
    change_column_default :videos, :duration, 0
  end

  def down
    change_column_default :videos, :duration, nil
  end
end
