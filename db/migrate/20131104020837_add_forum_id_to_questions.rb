class AddForumIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :forum_id, :integer
    add_index :questions, :forum_id
  end

end
