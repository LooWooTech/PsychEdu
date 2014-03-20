class CreateTopicTestings < ActiveRecord::Migration
  def change
    create_table :topic_testings do |t|
      t.references :topic, index: true
      t.string :title
      t.text :content
      t.text :requirements
      t.text :grading_rules

      t.timestamps
    end
  end
end
