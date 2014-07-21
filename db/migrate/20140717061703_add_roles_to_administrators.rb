class AddRolesToAdministrators < ActiveRecord::Migration
  class Administrator < ActiveRecord::Base; end

  def up
    add_column :administrators, :roles, :text
    if super_admin = Account.find_by_username(:admin).owner
      super_admin.roles << 'super_admin'
      super_admin.save
    end
  end

  def down
    remove_column :administrators, :roles
  end
end
