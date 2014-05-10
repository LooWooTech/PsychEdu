class CreateCaseAnalyses < ActiveRecord::Migration
  def change
    create_table :case_analyses do |t|
      t.string :title
      t.text :content
      t.references :topic, index: true
      t.references :created_by, index: true

      t.timestamps
    end
  end
end
