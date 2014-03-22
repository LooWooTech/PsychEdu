class TopicLearning < ActiveRecord::Base
  belongs_to :student
  belongs_to :topic

  has_many :learning_periods, :dependent => :destroy, :inverse_of => :topic_learning
  has_many :chapter_learnings, :dependent => :destroy
  has_many :exams, :dependent => :destroy, :class_name => 'TopicExam'

  validates :topic, :uniqueness => {:scope => :student}

  delegate :name, :guide_video_url, :review_video_url, :announcements, :testing, :to => :topic

  accepts_nested_attributes_for :learning_periods, :reject_if => lambda{|attr| attr[:start_on].blank? || attr[:end_on].blank?}

  after_create :create_chapter_learnings

  def unreviewed_exam
    exams.unreviewed.last
  end

  def ready_for_exam?
    testing && exam_history.all?(&:reviewed?)
  end

  def exam_history
    exams.submitted
  end

  def last_exam
    unsubmitted_exam || exams.create
  end

  def unsubmitted_exam
    exams.unsubmitted.last
  end

  def siblings
    student.topic_learnings - [self]
  end

  def start(start_on, end_on)
    learning_periods.create(:start_on => start_on, :end_on => end_on).valid?
  end

  def ask_for_leave(start_on, end_on)
    learning_periods_include_date(start_on).leave start_on, end_on
  end

  def ongoing?(date=Date.today)
    !leaving?(date) && !out_of_period?(date)
  end

  def leaving?(date=Date.today)
    learning_periods.any?{|period| period.leaving?(date) }
  end

  def out_of_period?(date=Date.today)
    !learning_periods.any?{|period| period.include_date?(date) }
  end

  def has_intersected_learning_periods?(target)
    learning_periods_intersected_with(target).any?
  end

  def learning_periods_intersected_with(learning_period)
    learning_periods.select{|period| period != learning_period && period.intersected?(learning_period) }
  end

  def learning_periods_include_date(date)
    learning_periods.find{|period| period.include_date? date }
  end

  def chapters
    topic ? topic.chapters : []
  end

  def current_learning_period
    learning_periods.find{|period| period.include_date?(Date.today) }
  end

  private

  def create_chapter_learnings
    chapters.each{|chapter| chapter_learnings.create :chapter => chapter }
  end
end
