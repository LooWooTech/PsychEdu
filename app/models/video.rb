class Video < ActiveRecord::Base
  include LearnableChild
  learnable_child_for :unit, :through => :unit_learnings, :as => :video_watchings

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :video_watchings, :dependent => :destroy

  delegate :chapter_name, :to => :unit
  delegate :name, :to => :unit, :prefix => true, :allow_nil => true

  validates :url, :uniqueness => {:scope => :unit}

  def root_path
    url[/.*\//]
  end

  def metadata_file_url
    "#{root_path}mulu.xml"
  end
end
