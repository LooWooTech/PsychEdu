class ChangeCaseAnalysisToTopicMaterial < ActiveRecord::Migration
  def change
    remove_index :case_analyses, :column => :topic_id 
    remove_index :case_analyses, :column => :created_by_id
    remove_index :case_videos, :column => :case_analysis_id
    remove_index :case_attachments, :column => :case_analysis_id

    rename_table :case_analyses, :topic_materials
    add_column :topic_materials, :type, :string
    rename_table :case_videos, :topic_material_videos
    rename_column :topic_material_videos, :case_analysis_id, :topic_material_id
    rename_table :case_attachments, :topic_material_attachments
    rename_column :topic_material_attachments, :case_analysis_id, :topic_material_id

    add_index :topic_materials, :topic_id 
    add_index :topic_materials, :created_by_id
    add_index :topic_material_videos, :topic_material_id
    add_index :topic_material_attachments, :topic_material_id
  end
end
