class VideoWatching < ActiveRecord::Base
  belongs_to :unit_learning
  belongs_to :video

  has_many :notes, :dependent => :destroy

  delegate :url, :course_name, :unit_name, :to => :video

  def siblings
    unit_learning.video_watchings - [self]
  end

  def interaction_file_url
    video.interaction_file.url
  end
end
