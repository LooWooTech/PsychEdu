class CreateTopicExams < ActiveRecord::Migration
  def change
    create_table :topic_exams do |t|
      t.references :topic_learning, index: true
      t.text :review
      t.boolean :submitted, :default => false
      t.integer :score, :default => 0

      t.timestamps
    end
  end
end
