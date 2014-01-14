class ChapterLearning < ActiveRecord::Base
  belongs_to :topic_learning
  belongs_to :chapter

  has_many :unit_learnings, :dependent => :destroy

  delegate :student, :to => :topic_learning
  delegate :name, :introduction, :topic, :first?, :last?, :has_only_one_unit?, :to => :chapter

  after_create :create_unit_learnings

  def previous
    first? ? nil : topic_learning.chapter_learnings.find_by(:chapter => chapter.previous)
  end

  def next
    last? ? nil : topic_learning.chapter_learnings.find_by(:chapter => chapter.next)
  end

  def open?
    first? || previous.passed?
  end

  def passed?
    unit_learnings.all? &:passed?
  end

  def units
    chapter ? chapter.units : []
  end

  private

  def create_unit_learnings
    units.each{|unit| unit_learnings.create :unit => unit }
  end
end
