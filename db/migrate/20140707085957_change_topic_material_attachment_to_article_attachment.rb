class ChangeTopicMaterialAttachmentToArticleAttachment < ActiveRecord::Migration

  class ArticleAttachment < ActiveRecord::Base; end

  def up
    rename_table :topic_material_attachments, :article_attachments
    add_column :article_attachments, :article_type, :string
    rename_column :article_attachments, :topic_material_id, :article_id
    ArticleAttachment.find_each{|a| a.update_attribute :article_type, 'TopicMaterial' }
  end

  def down
    rename_column :article_attachments, :article_id, :topic_material_id
    remove_column :article_attachments, :article_type
    rename_table :article_attachments, :topic_material_attachments
  end
end
