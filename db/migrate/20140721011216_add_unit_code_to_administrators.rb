class AddUnitCodeToAdministrators < ActiveRecord::Migration
  def change
    add_column :administrators, :unit_code, :string
  end
end
