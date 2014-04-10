class MovePasswordCipherFromStudentsToAccounts < ActiveRecord::Migration
  def up
    add_column :accounts, :cipher, :string
    add_column :accounts, :cipher_answer, :string
    remove_column :students, :cipher
    remove_column :students, :cipher_answer
  end

  def down
    remove_column :accounts, :cipher
    remove_column :accounts, :cipher_answer
    add_column :students, :cipher, :string
    add_column :students, :cipher_answer, :string
  end
end
