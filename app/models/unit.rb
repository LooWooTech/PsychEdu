class Unit < ActiveRecord::Base
  include LearnableChild
  learnable_child_for :chapter, :through => :chapter_learnings, :as => :unit_learnings

  has_many :videos, :dependent => :destroy
  has_many :unit_learnings, :dependent => :destroy

  acts_as_list :scope => :chapter

  delegate :name, :to => :chapter, :prefix => true

  alias previous higher_item
  alias next lower_item

  validates :name, :uniqueness => {:scope => :chapter_id}

  accepts_nested_attributes_for :videos, 
    :reject_if => proc {|attrs| attrs['url'].blank?},
    :allow_destroy => true

  def duration
    videos.sum :duration
  end

end
