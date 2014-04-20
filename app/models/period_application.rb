class PeriodApplication < ActiveRecord::Base
  enum :review_state => [:unreviewed, :accepted, :rejected]
  belongs_to :reviewer, :class_name => 'Administrator'
  belongs_to :topic_learning

  delegate :student_username, :student_name, :name, :to => :topic_learning
end
