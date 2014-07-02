class TopicExamScore < ActiveRecord::Base
  belongs_to :topic_exam
  belongs_to :rule, :class_name => 'ScoreRule', :foreign_key => 'score_rule_id'

  delegate :name, :description, :to => :rule, :prefix => true

  def reviewed?
    comment.present?
  end

end
