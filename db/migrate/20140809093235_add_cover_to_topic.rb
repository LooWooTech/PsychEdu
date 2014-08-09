class AddCoverToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :cover, :string
  end
end
