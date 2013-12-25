class TopicLearning < ActiveRecord::Base
  belongs_to :student
  belongs_to :topic

  has_many :learning_periods, :dependent => :destroy
  has_many :chapter_learnings, :dependent => :destroy

  validates :topic, :uniqueness => {:scope => :student}

  delegate :name, :to => :topic

  after_create :create_chapter_learnings

  def start(start_on, end_on)
    learning_periods.create(:start_on => start_on, :end_on => end_on).valid?
  end

  def ask_for_leave(start_on, end_on)
    learning_periods_include_date(start_on).leave start_on, end_on
  end

  def ongoing?(date=Date.today)
    !leaving?(date) && learning_periods.any?{|period| period.include_date?(date) }
  end

  def leaving?(date=Date.today)
    learning_periods.any?{|period| period.leaving?(date) }
  end

  def has_intersected_learning_periods?(target)
    learning_periods_intersected_with(target).any?
  end

  def learning_periods_intersected_with(learning_period)
    learning_periods.select{|period| period.intersected? learning_period }
  end

  def learning_periods_include_date(date)
    learning_periods.find{|period| period.include_date? date }
  end

  def chapters
    topic ? topic.chapters : []
  end

  private

  def create_chapter_learnings
    chapters.each{|chapter| chapter_learnings.create :chapter => chapter }
  end
end
