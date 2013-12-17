class SubjectLearning < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject

  has_many :learning_periods, :dependent => :destroy
  has_many :course_learnings, :dependent => :destroy

  validates :subject_id, :uniqueness => {:scope => :student_id}

  delegate :name, :courses, :to => :subject

  after_create :create_course_learnings

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

  private

  def create_course_learnings
    courses.each{ |course| course_learnings.create :course => course }
  end
end
