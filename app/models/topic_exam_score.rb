class TopicExamScore < ActiveRecord::Base
  belongs_to :topic_exam
  belongs_to :rule, :class_name => 'ScoreRule', :foreign_key => 'score_rule_id'

  delegate :name, :description, :to => :rule, :prefix => true

  validates :score, :numericality => {:less_than_or_equal_to => :total}, :on => :update

  def reviewed?
    score.present?
  end

  def total
    rule.score || 0
  end

end
