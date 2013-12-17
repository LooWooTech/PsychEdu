class Course < ActiveRecord::Base
  belongs_to :subject

  has_many :course_learnings, :dependent => :destroy
  has_many :units, :dependent => :destroy

  acts_as_list :scope => :subject

  validates :name, :presence => true, :uniqueness => {:scope => :subject_id}

  delegate :name, :to => :subject, :prefix => true
  delegate :subject_learnings, :to => :subject

  after_create :create_course_learning_for_each_subject_learning

  alias previous higher_item
  alias next lower_item

  def duration
    units.to_a.sum &:duration
  end

  private

  def create_course_learning_for_each_subject_learning
    subject_learnings.each do |subject_learning|
      subject_learning.course_learnings.create :course => self
    end
  end
end
