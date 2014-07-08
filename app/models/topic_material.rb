class TopicMaterial < ActiveRecord::Base
  include HasManyLinkedVideos
  include HasManyAttachments

  belongs_to :topic
  belongs_to :created_by, :class_name => 'Administrator'

  validates :title, :presence => true
  validates :content, :presence => true
  validates :topic_id, :presence => true
  validates :created_by_id, :presence => true
end
