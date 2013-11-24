class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.string :login
      t.string :password_digest
      t.references :owner, index: true
      t.string :owner_type

      t.timestamps
    end

    change_table :administrators do |t|
      t.remove :login
      t.remove :password_digest
    end
  end

  def down
    change_table :administrators do |t|
      t.string :login
      t.string :password_digest
    end

    drop_table :accounts
  end
end
