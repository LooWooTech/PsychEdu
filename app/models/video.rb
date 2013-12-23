class Video < ActiveRecord::Base
  include LearnableChild
  learnable_child_for :unit, :through => :unit_learnings, :as => :video_watchings

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :video_watchings, :dependent => :destroy

  delegate :course_name, :to => :unit
  delegate :name, :to => :unit, :prefix => true, :allow_nil => true

  mount_uploader :interaction_file, VideoInteractionFileUploader

  validates :url, :uniqueness => {:scope => :unit}
end
