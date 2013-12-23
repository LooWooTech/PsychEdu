class UnitLearning < ActiveRecord::Base
  belongs_to :course_learning
  belongs_to :unit

  delegate :name, :course, :first?, :last?, :to => :unit
  delegate :videos, :course_name, :to => :unit

  has_many :video_watchings, :dependent => :destroy

  validate :unit_must_be_in_the_same_learning_course, :if => :course_learning

  after_create :create_video_watchings

  def open?
    course_learning.open? && video_watchings.any? && (first? || previous.passed?)
  end

  def previous
    first? ? nil : course_learning.unit_learnings.find_by(:unit => unit.previous)
  end

  def next
    last? ? nil : course_learning.unit_learnings.find_by(:unit => unit.next)
  end

  def passed?
    true
  end

  private

  def unit_must_be_in_the_same_learning_course
    errors[:base] << 'the unit must be in the same learning course' if course != course_learning.course
  end

  def create_video_watchings
    videos.each{|video| video_watchings.create :video => video }
  end
end