class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.boolean :top, :default => false
      t.boolean :refined, :default => false

      t.timestamps
    end
  end
end
