class Unit < ActiveRecord::Base
  include LearnableChild
  include QuestionImporter

  learnable_child_for :chapter, :through => :chapter_learnings, :as => :unit_learnings

  has_many :videos, :dependent => :destroy
  has_many :unit_learnings, :dependent => :destroy
  has_many :singular_choice_questions, :dependent => :destroy
  has_many :multiple_choice_questions, :dependent => :destroy

  mount_uploader :question_repository_file, QuestionRepositoryUploader

  acts_as_list :scope => :chapter

  delegate :name, :to => :chapter, :prefix => true

  validates :name, :uniqueness => {:scope => :chapter_id}

  accepts_nested_attributes_for :videos, 
    :reject_if => proc {|attrs| attrs['url'].blank?},
    :allow_destroy => true

  alias previous higher_item
  alias next lower_item

  def ready_for_exam?
    exam_question_count > 0
  end

  def exam_question_count
    singular_choice_questions.count + multiple_choice_questions.count
  end

  def duration
    videos.sum :duration
  end

  def only_child?
    chapter.has_only_one_unit?
  end

end
