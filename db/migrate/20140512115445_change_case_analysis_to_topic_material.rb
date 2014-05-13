class ChangeCaseAnalysisToTopicMaterial < ActiveRecord::Migration
  def change
    rename_table :case_analyses, :topic_materials
    add_column :topic_materials, :type, :string
    rename_table :case_videos, :topic_material_videos
    rename_column :topic_material_videos, :case_analysis_id, :topic_material_id
    rename_table :case_attachments, :topic_material_attachments
    rename_column :topic_material_attachments, :case_analysis_id, :topic_material_id
  end
end
