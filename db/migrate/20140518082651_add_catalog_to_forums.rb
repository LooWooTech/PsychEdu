class AddCatalogToForums < ActiveRecord::Migration
  def change
    add_reference :forums, :catalog, index: true
    add_column :forums, :deleted_at, :datetime
  end
end
