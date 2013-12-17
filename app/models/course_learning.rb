class CourseLearning < ActiveRecord::Base
  belongs_to :subject_learning
  belongs_to :course

  has_many :unit_learnings, :dependent => :destroy

  delegate :student, :to => :subject_learning
  delegate :name, :introduction, :subject, :units, :first?, :last?, :to => :course

  validates :course_id, :uniqueness => {:scope => :subject_learning_id}
  validate :course_must_in_the_learning_subject

  after_create :create_unit_learnings

  def previous
    first? ? nil : subject_learning.course_learnings.find_by(:course => course.previous)
  end

  def next
    last? ? nil : subject_learning.course_learnings.find_by(:course => course.next)
  end

  def open?
    first? || previous.passed?
  end

  def passed?
    true
  end

  private

  def course_must_in_the_learning_subject
    errors[:base] << 'the course must be in the learning subject' if subject != subject_learning.subject
  end

  def create_unit_learnings
    units.each{|unit| unit_learnings.create :unit => unit }
  end
end
