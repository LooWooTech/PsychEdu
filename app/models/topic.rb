class Topic < ActiveRecord::Base
  has_many :topic_learnings, :dependent => :destroy
  has_many :chapters, :dependent => :destroy

  validates :name, :uniqueness => true, :presence => true

  def chapter_count
    chapters.count
  end

  def duration
    chapters.to_a.sum &:duration
  end

end
