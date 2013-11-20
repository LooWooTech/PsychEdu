class AddCommenterTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenter_type, :string
  end
end
