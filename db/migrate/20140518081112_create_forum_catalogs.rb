class CreateForumCatalogs < ActiveRecord::Migration
  def change
    create_table :forum_catalogs do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
