class TopicExam < ActiveRecord::Base
  PASS_LINE = 60

  belongs_to :topic_learning
  belongs_to :reviewer, :class_name => 'Administrator'

  has_many :materials, :class_name => 'TopicExamMaterial', :dependent => :destroy
  has_many :scores, :class_name => 'TopicExamScore', :dependent => :destroy

  scope :unsubmitted, lambda{ where :submitted => false }
  scope :submitted, lambda{ where :submitted => true }
  scope :unreviewed, lambda{ submitted.joins(:scores).where('topic_exam_scores.comment IS NULL OR TRIM(topic_exam_scores.comment) = ""').distinct }
  scope :reviewed, lambda{ submitted.joins(:scores).where('topic_exam_scores.comment IS NOT NULL AND TRIM(topic_exam_scores.comment) <> ""').distinct }
  scope :unassigned, lambda{ where(:reviewer => nil) }
  scope :assigned, lambda{ where.not(:reviewer => nil) }
  scope :unassigned_for, lambda{|expert| unassigned.joins(:topic_learning).joins('INNER JOIN administrators_topics AS a_t ON a_t.topic_id = topic_learnings.topic_id').where('a_t.administrator_id' => expert.id) }

  delegate :title, :content, :requirements, :to => :topic_testing
  delegate :name, :student, :student_name, :student_username, :student_unit_code, :to => :topic_learning
  delegate :username, :to => :reviewer, :prefix => true

  accepts_nested_attributes_for :scores, :reject_if => lambda{|attr| attr[:comment].blank? }

  before_save :set_passed_at
  after_create :create_scores

  def score
    scores.sum :score
  end

  def passed?
    reviewed? && score >= PASS_LINE
  end

  def unpassed?
    reviewed? && score < PASS_LINE
  end

  def unsubmitted?
    !submitted?
  end

  def topic_testing
    topic_learning.testing
  end

  def reviewed?
    scores.all? &:reviewed?
  end

  def submit
    update_attribute :submitted, true
  end

  private

  def set_passed_at
    self.passed_at = Time.now if passed?
  end

  def create_scores
    topic_testing.score_rules.each do |rule|
      scores.create :rule => rule
    end
  end
end
