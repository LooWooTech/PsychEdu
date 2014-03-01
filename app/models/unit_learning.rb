class UnitLearning < ActiveRecord::Base

  EXAM_TIMES_LIMIT = 3
  
  belongs_to :chapter_learning
  belongs_to :unit

  delegate :name, :chapter, :first?, :last?, 
    :videos, :chapter_name, :singular_choice_count, :multiple_choice_count,
    :singular_choice_questions, :multiple_choice_questions, :ready_for_exam?,
    :only_child?, :summary, :review,
    :to => :unit

  has_many :video_watchings, :dependent => :destroy
  has_many :exams, :class_name => 'UnitExam', :dependent => :destroy

  after_create :create_video_watchings

  def exam_limited?
    passed_exams.count >= EXAM_TIMES_LIMIT
  end

  def unfinished_exam
    exams.find{|exam| !exam.over? }
  end

  def open?
    chapter_learning.open? && video_watchings.any? && (first? || previous.passed?)
  end

  def previous
    first? ? nil : chapter_learning.unit_learnings.find_by(:unit => unit.previous)
  end

  def next
    last? ? nil : chapter_learning.unit_learnings.find_by(:unit => unit.next)
  end

  def passed?
    passed_exams.any?
  end

  def passed_exams
    exams.select{|exam| exam.passed? }
  end

  def generate_exam
    exams.create
  end

  def random_singular_choice_questions(&block)
    singular_choice_questions.shuffle[0, singular_choice_count].each &block
  end

  def random_multiple_choice_questions(&block)
    multiple_choice_questions.shuffle[0, multiple_choice_count].each &block
  end

  def seconds
    video_watchings.sum :seconds
  end

  def passed_exams
    exams.select &:passed?
  end

  def passed?
    passed_exams.any?
  end

  def average_score
    return 0 if !passed?
    passed_exams.average &:score
  end

  private

  def create_video_watchings
    videos.each{|video| video_watchings.create :video => video }
  end
end
