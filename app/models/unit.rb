class Unit < ActiveRecord::Base
  belongs_to :course

  has_many :videos, :dependent => :destroy
  has_many :unit_learnings, :dependent => :destroy

  acts_as_list :scope => :course

  delegate :name, :to => :course, :prefix => true
  delegate :course_learnings, :to => :course

  after_create :create_unit_learning_for_each_course_learning

  alias previous higher_item
  alias next lower_item

  validates :name, :uniqueness => {:scope => :course_id}

  accepts_nested_attributes_for :videos, 
    :reject_if => proc {|attrs| attrs['url'].blank?},
    :allow_destroy => true

  def duration
    videos.sum :duration
  end

  private

  def create_unit_learning_for_each_course_learning
    course_learnings.each do |course_learning|
      course_learning.unit_learnings.create :unit => self
    end
  end
end
