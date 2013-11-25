class ChangeAccountsLoginToUsername < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.rename :login, :username
    end
  end
end
