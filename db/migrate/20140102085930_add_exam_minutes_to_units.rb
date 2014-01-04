class AddExamMinutesToUnits < ActiveRecord::Migration
  def change
    add_column :units, :exam_minutes, :integer, :default => 0
  end
end
