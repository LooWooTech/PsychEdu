class AddPositionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :position, :integer, :default => 0
  end
end
