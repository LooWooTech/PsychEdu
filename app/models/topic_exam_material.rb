class TopicExamMaterial < ActiveRecord::Base
  belongs_to :topic_exam

  validates :file, :presence => true

  mount_uploader :file, TopicExamMaterialUploader

  delegate :topic_learning, :to => :topic_exam

  def filename
    File.basename(file.path)
  end

  def url
    file.url
  end
end
