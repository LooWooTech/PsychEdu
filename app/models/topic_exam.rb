class TopicExam < ActiveRecord::Base
  PASS_LINE = 60

  belongs_to :topic_learning

  has_many :materials, :class_name => 'TopicExamMaterial', :dependent => :destroy

  scope :unsubmitted, lambda{ where :submitted => false }
  scope :submitted, lambda{ where :submitted => true }
  scope :unreviewed, lambda{ where :review => nil }
  scope :reviewed, lambda{ where.not(:review => nil) }

  delegate :title, :content, :requirements, :grading_rules, :to => :topic_testing
  delegate :name, :student_name, :student_username, :student_unit_code, :to => :topic_learning

  before_save :set_passed_at

  def passed?
    score >= PASS_LINE
  end

  def unsubmitted?
    !submitted?
  end

  def topic_testing
    topic_learning.testing
  end

  def reviewed?
    !review.nil?
  end

  def submit
    update_attribute :submitted, true
  end

  private

  def set_passed_at
    passed_at = Time.now if passed?
  end
end
