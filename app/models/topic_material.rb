class TopicMaterial < ActiveRecord::Base

  include HasManyLinkedVideos

  belongs_to :topic
  belongs_to :created_by, :class_name => 'Administrator'

  has_many :attachments, :class_name => 'TopicMaterialAttachment', :dependent => :destroy

  validates :title, :presence => true
  validates :content, :presence => true
  validates :topic_id, :presence => true
  validates :created_by_id, :presence => true

  accepts_nested_attributes_for :attachments,
    :reject_if => lambda{|attr| attr[:file].blank? },
    :allow_destroy => true
end
