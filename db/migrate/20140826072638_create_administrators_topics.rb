class CreateAdministratorsTopics < ActiveRecord::Migration
  def change
    create_table :administrators_topics do |t|
      t.integer :administrator_id
      t.integer :topic_id
    end
  end
end
