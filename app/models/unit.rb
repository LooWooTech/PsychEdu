class Unit < ActiveRecord::Base
  include LearnableChild

  has_many :videos, :dependent => :destroy
  has_many :unit_learnings, :dependent => :destroy
  has_many :singular_choice_questions, :dependent => :destroy
  has_many :multiple_choice_questions, :dependent => :destroy

  acts_as_list :scope => :chapter

  delegate :name, :to => :chapter, :prefix => true
  delegate :topic_name, :to => :chapter

  validates :name, :uniqueness => {:scope => :chapter_id}, :presence => true

  accepts_nested_attributes_for :videos, 
    :reject_if => proc {|attrs| attrs['url'].blank?},
    :allow_destroy => true

  learnable_child_for :chapter, :through => :chapter_learnings, :as => :unit_learnings

  alias previous higher_item
  alias next lower_item

  def ready_for_exam?
    exam_questions.count > 0
  end

  def exam_questions
    singular_choice_questions + multiple_choice_questions
  end

  def duration
    videos.sum :duration
  end

  def only_child?
    chapter.has_only_one_unit?
  end

end
