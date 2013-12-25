class RemoveInteractionFileFormVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :interaction_file
  end

  def down
    add_column :videos, :interaction_file, :string
  end
end
