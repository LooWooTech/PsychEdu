class AddIndexForPolymorphicColumn < ActiveRecord::Migration
  def up
    add_index :accounts, [:owner_id, :owner_type]
    add_index :answers, [:answerer_id, :answerer_type]
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, [:commenter_id, :commenter_type]
    add_index :complaints, [:complainer_id, :complainer_type]
    add_index :complaints, [:complainable_id, :complainable_type]
    add_index :questions, [:questioner_id, :questioner_type]

    remove_index :accounts, :owner_id
    remove_index :answers, :answerer_id
    remove_index :comments, :commentable_id
    remove_index :comments, :commenter_id
    remove_index :complaints, :complainer_id
    remove_index :complaints, :complainable_id
    remove_index :questions, :questioner_id
  end

  def down
    remove_index :accounts, [:owner_id, :owner_type]
    remove_index :answers, [:answerer_id, :answerer_type]
    remove_index :comments, [:commentable_id, :commentable_type]
    remove_index :comments, [:commenter_id, :commenter_type]
    remove_index :complaints, [:complainer_id, :complainer_type]
    remove_index :complaints, [:complainable_id, :complainable_type]
    remove_index :questions, [:questioner_id, :questioner_type]

    add_index :accounts, :owner_id
    add_index :answers, :answerer_id
    add_index :comments, :commentable_id
    add_index :comments, :commenter_id
    add_index :complaints, :complainer_id
    add_index :complaints, :complainable_id
    add_index :questions, :questioner_id
  end
end
