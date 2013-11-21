class AddPasswordToAdministrators < ActiveRecord::Migration
  def change
    add_column :administrators, :password_digest, :string
  end
end
