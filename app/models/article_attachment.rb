class ArticleAttachment < ActiveRecord::Base
  belongs_to :article, :polymorphic => true

  mount_uploader :file, AttachmentsUploader

  def filename
    file.file.filename
  end

  def url
    file ? file.url : ''
  end
end
