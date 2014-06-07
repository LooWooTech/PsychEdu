class RenameTopicMaterialVideoToLinkedVideo < ActiveRecord::Migration

  class LinkedVideo < ActiveRecord::Base
    self.table_name = 'linked_videos'
  end

  class TopicMaterial < ActiveRecord::Base
    self.table_name = 'topic_materials'
  end

  def up
    rename_table :topic_material_videos, :linked_videos
    rename_column :linked_videos, :topic_material_id, :master_id
    add_column :linked_videos, :master_type, :string
    add_index :linked_videos, [:master_id, :master_type]
    LinkedVideo.find_each do |v|
      class_name = TopicMaterial.find(v.master_id).try(:type)
      v.update_attribute(:master_type, class_name) if class_name
    end
  end

  def down
    remove_index :linked_videos, [:master_id, :master_type]
    remove_column :linked_videos, :master_type
    rename_column :linked_videos, :master_id, :topic_material_id
    rename_table :linked_videos, :topic_material_videos
  end
end
