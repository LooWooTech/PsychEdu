class TopicExam < ActiveRecord::Base
  belongs_to :topic_learning

  has_many :materials, :class_name => 'TopicExamMaterial', :dependent => :destroy

  scope :unsubmitted, lambda{ where :submitted => false }
  scope :submitted, lambda{ where :submitted => true }
  scope :unreviewed, lambda{ where :review => nil }

  delegate :title, :content, :requirements, :grading_rules, :to => :topic_testing
  delegate :name, :student_name, :student_unit_code, :to => :topic_learning

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
end
