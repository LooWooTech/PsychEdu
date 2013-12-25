class Course < ActiveRecord::Base
  include LearnableChild
  learnable_child_for :topic, :through => :topic_learnings, :as => :course_learnings

  has_many :course_learnings, :dependent => :destroy
  has_many :units, :dependent => :destroy

  acts_as_list :scope => :topic

  validates :name, :presence => true, :uniqueness => {:scope => :topic}

  delegate :name, :to => :topic, :prefix => true, :allow_nil => true

  alias previous higher_item
  alias next lower_item

  def duration
    units.to_a.sum &:duration
  end

end
