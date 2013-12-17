class AddPositionToUnit < ActiveRecord::Migration
  def change
    add_column :units, :position, :integer, :default => 0
  end
end
