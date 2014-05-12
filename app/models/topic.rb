class Topic < ActiveRecord::Base
  has_many :topic_learnings, :dependent => :destroy
  has_many :chapters, :dependent => :destroy
  has_many :announcements, :dependent => :destroy
  has_many :case_analyses, :dependent => :destroy
  has_one :testing, :class_name => 'TopicTesting', :dependent => :destroy

  scope :unopen_for, lambda{|student| where.not(:id => student.topic_learnings.pluck(:topic_id)) }
  scope :no_testing, lambda{ where.not(:id => TopicTesting.pluck(:topic_id)) }

  validates :name, :uniqueness => true, :presence => true

  def chapter_count
    chapters.count
  end

  def duration
    chapters.to_a.sum &:duration
  end

end
