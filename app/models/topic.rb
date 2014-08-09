class Topic < ActiveRecord::Base

  mount_uploader :cover, TopicCoverUploader

  has_many :topic_learnings, :dependent => :destroy
  has_many :chapters, :dependent => :destroy
  has_many :announcements, :dependent => :destroy
  has_many :materials, :class_name => 'TopicMaterial', :dependent => :destroy
  has_many :case_analyses
  has_many :extended_topic_materials
  has_one :testing, :class_name => 'TopicTesting', :dependent => :destroy

  scope :unopen_for, lambda{|student| where.not(:id => student.topic_learnings.pluck(:topic_id)) }
  scope :no_testing, lambda{ where.not(:id => TopicTesting.pluck(:topic_id)) }

  validates :name, :uniqueness => true, :presence => true

  def cover_url
    cover.url
  end

  def has_cover?
    !!cover.file
  end

  def chapter_count
    chapters.count
  end

  def duration
    chapters.to_a.sum &:duration
  end

end
