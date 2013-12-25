class VideoWatching < ActiveRecord::Base
  belongs_to :unit_learning
  belongs_to :video

  has_many :notes, :dependent => :destroy

  delegate :comments, :url, :course_name, :unit_name, :metadata_file_url, :root_path, :to => :video

  def siblings
    unit_learning.video_watchings - [self]
  end

end
