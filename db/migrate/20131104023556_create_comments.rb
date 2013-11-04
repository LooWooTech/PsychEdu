class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :commentable, index: true
      t.string :commentable_type
      t.references :commenter, index: true

      t.timestamps
    end
  end
end
