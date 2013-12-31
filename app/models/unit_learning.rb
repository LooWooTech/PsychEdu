class UnitLearning < ActiveRecord::Base
  belongs_to :chapter_learning
  belongs_to :unit

  delegate :name, :chapter, :first?, :last?, :to => :unit
  delegate :videos, :chapter_name, :to => :unit

  has_many :video_watchings, :dependent => :destroy
  has_many :exams, :class_name => 'UnitExam', :dependent => :destroy

  after_create :create_video_watchings

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
    true
  end

  private

  def create_video_watchings
    videos.each{|video| video_watchings.create :video => video }
  end
end
