class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :content
      t.boolean :correct, :default => false
      t.references :choice_question, :polymorphic => true, :index => true

      t.timestamps
    end
  end
end
