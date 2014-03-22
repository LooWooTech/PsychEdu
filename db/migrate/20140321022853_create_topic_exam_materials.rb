class CreateTopicExamMaterials < ActiveRecord::Migration
  def change
    create_table :topic_exam_materials do |t|
      t.references :topic_exam, index: true
      t.string :file
      t.text :note

      t.timestamps
    end
  end
end
