class AddComplainerTypeToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :complainer_type, :string
  end
end
