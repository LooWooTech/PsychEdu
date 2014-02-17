class VideoWatching < ActiveRecord::Base
  belongs_to :unit_learning
  belongs_to :video

  has_many :notes, :dependent => :destroy

  delegate :name, :comments, :url, 
    :chapter_name, :unit_name, 
    :metadata_file_url, :root_path,
    :teacher_names, :duration, :to => :video
  delegate :chapter_learning, :to => :unit_learning

  def siblings
    # unit_learning.video_watchings - [self]
    unit_learning.video_watchings
  end

end
