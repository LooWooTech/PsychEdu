class UnitLearning < ActiveRecord::Base
  belongs_to :course_learning
  belongs_to :unit

  delegate :name, :course, :first?, :last?, :to => :unit

  validate :unit_must_be_in_the_same_learning_course

  def opened?
    course_learning.opened? && (first? || previous.passed?)
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
end
