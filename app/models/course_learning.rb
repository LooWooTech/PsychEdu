class CourseLearning < ActiveRecord::Base
  belongs_to :topic_learning
  belongs_to :course

  has_many :unit_learnings, :dependent => :destroy

  delegate :student, :to => :topic_learning
  delegate :name, :introduction, :topic, :first?, :last?, :to => :course

  after_create :create_unit_learnings

  def previous
    first? ? nil : topic_learning.course_learnings.find_by(:course => course.previous)
  end

  def next
    last? ? nil : topic_learning.course_learnings.find_by(:course => course.next)
  end

  def open?
    first? || previous.passed?
  end

  def passed?
    true
  end

  def units
    course ? course.units : []
  end

  private

  def create_unit_learnings
    units.each{|unit| unit_learnings.create :unit => unit }
  end
end
