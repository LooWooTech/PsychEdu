class TopicMaterialAttachment < ActiveRecord::Base
  belongs_to :case_analysis
  mount_uploader :file, AttachmentsUploader

  def filename
    file.file.filename
  end

  def url
    file.url
  end
end
