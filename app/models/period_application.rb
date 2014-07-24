class PeriodApplication < ActiveRecord::Base
  enum :review_state => [:unreviewed, :accepted, :rejected]
  belongs_to :reviewer, :class_name => 'Administrator'
  belongs_to :topic_learning

  delegate :student_username, :student_name, :name, :to => :topic_learning

  scope :in_unit, lambda {|unit_code| joins('JOIN topic_learnings AS t ON t.id = period_applications.topic_learning_id JOIN students AS s ON s.id = t.student_id').where('s.unit_code' => unit_code) }
end
