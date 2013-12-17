class Video < ActiveRecord::Base
  include AssociatedTree

  belongs_to :unit

  has_many :comments, :as => :commentable, :dependent => :destroy

  delegate :course_name, :unit_learnings, :to => :unit
  delegate :name, :to => :unit, :prefix => true

  mount_uploader :interaction_file, VideoInteractionFileUploader

  validates :url, :uniqueness => {:scope => :unit_id}

  auto_create :video_watchings, :for => :unit_learnings
end
