class UnitLearning < ActiveRecord::Base
  belongs_to :chapter_learning
  belongs_to :unit

  delegate :name, :chapter, :first?, :last?, 
    :videos, :chapter_name, :singular_choice_count, :multiple_choice_count,
    :singular_choice_questions, :multiple_choice_questions,
    :to => :unit

  has_many :video_watchings, :dependent => :destroy
  has_many :exams, :class_name => 'UnitExam', :dependent => :destroy

  after_create :create_video_watchings

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
    exams.any?{|exam| exam.passed? }
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

  private

  def create_video_watchings
    videos.each{|video| video_watchings.create :video => video }
  end
end
