class AddForumIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :forum_id, :integer
  end
end
