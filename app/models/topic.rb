class Topic < ActiveRecord::Base
  has_many :topic_learnings, :dependent => :destroy
  has_many :courses, :dependent => :destroy

  validates :name, :uniqueness => true, :presence => true

  def course_count
    courses.count
  end

  def duration
    courses.to_a.sum &:duration
  end

end
