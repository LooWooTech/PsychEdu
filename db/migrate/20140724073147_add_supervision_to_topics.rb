class AddSupervisionToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :supervision, :text
  end
end
