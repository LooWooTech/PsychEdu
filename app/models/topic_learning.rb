class TopicLearning < ActiveRecord::Base
  belongs_to :student
  belongs_to :topic

  has_many :period_applications, :dependent => :destroy
  has_many :learning_periods, :inverse_of => :topic_learning
  has_many :leaving_periods
  has_many :leaving_period_resumings
  has_many :chapter_learnings, :dependent => :destroy
  has_many :exams, :dependent => :destroy, :class_name => 'TopicExam'
  has_many :monthly_online_trackings, :dependent => :destroy
  has_many :unit_exams, :through => :chapter_learnings

  validates :topic, :uniqueness => {:scope => :student}

  delegate :extended_topic_materials, :case_analyses, :name,
    :guide_video_url, :review_video_url, :announcements, :testing,
    :to => :topic
  delegate :username, :name, :unit_code, :to => :student, :prefix => true

  accepts_nested_attributes_for :learning_periods, :reject_if => lambda{|attr| attr[:start_on].blank? || attr[:end_on].blank?}

  after_create :create_chapter_learnings

  def graduate?
    exams.any? &:passed?
  end

  def has_unreviewed_application?
    learning_periods.any? &:has_unreviewed_application?
  end

  def heartbeat
    monthly_online_trackings.current.heartbeat
  end

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
    learning_periods.create :start_on => start_on, :end_on => end_on
  end

  def leave(start_on, end_on)
    learning_period_include_date(start_on).try :leave, start_on, end_on
  end

  def resume(start_on)
    leaving_period_include_date(start_on).try :resume, start_on
  end

  def ongoing?(date=Date.today)
    !leaving?(date) && !out_of_period?(date)
  end

  def leaving?(date=Date.today)
    accepted_learning_periods.any?{|period| period.leaving?(date) }
  end

  def out_of_period?(date=Date.today)
    !accepted_learning_periods.any?{|period| period.include_date?(date) }
  end

  def has_intersected_learning_periods?(target)
    learning_periods_intersected_with(target).any?
  end

  def learning_periods_intersected_with(learning_period)
    accepted_learning_periods.select{|period| period != learning_period && period.intersected?(learning_period) }
  end

  def learning_period_include_date(date)
    accepted_learning_periods.find{|period| period.include_date? date }
  end

  def leaving_period_include_date(date)
    leaving_periods.find{|period| period.include_date? date }
  end

  def chapters
    topic ? topic.chapters : []
  end

  def current_learning_period
    accepted_learning_periods.find{|period| period.include_date?(Date.today) }
  end

  def accepted_learning_periods
    learning_periods.accepted
  end

  private

  def create_chapter_learnings
    chapters.each{|chapter| chapter_learnings.create :chapter => chapter }
  end
end
