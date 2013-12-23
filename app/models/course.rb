class Course < ActiveRecord::Base
  include LearnableChild
  learnable_child_for :subject, :through => :subject_learnings, :as => :course_learnings

  has_many :course_learnings, :dependent => :destroy
  has_many :units, :dependent => :destroy

  acts_as_list :scope => :subject

  validates :name, :presence => true, :uniqueness => {:scope => :subject_id}

  delegate :name, :to => :subject, :prefix => true, :allow_nil => true

  alias previous higher_item
  alias next lower_item

  def duration
    units.to_a.sum &:duration
  end

end
