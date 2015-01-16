class ChangeTopicMaterialAttachmentToArticleAttachment < ActiveRecord::Migration

  class ArticleAttachment < ActiveRecord::Base; end

  def up
    remove_index :topic_material_attachments, :column => :topic_material_id

    rename_table :topic_material_attachments, :article_attachments
    add_column :article_attachments, :article_type, :string
    rename_column :article_attachments, :topic_material_id, :article_id
    ArticleAttachment.find_each{|a| a.update_attribute :article_type, 'TopicMaterial' }

    add_index :article_attachments, [:article_id, :article_type]
  end

  def down
    remove_index :article_attachments, :column => [:article_id, :article_type]

    rename_column :article_attachments, :article_id, :topic_material_id
    remove_column :article_attachments, :article_type
    rename_table :article_attachments, :topic_material_attachments

    add_index :topic_material_attachments, :topic_material_id
  end
end
