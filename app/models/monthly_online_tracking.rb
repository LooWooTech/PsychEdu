class MonthlyOnlineTracking < ActiveRecord::Base

  INTERVAL_MINUTES = 5
  INTERVAL_MILLISECONDS = INTERVAL_MINUTES * 60 * 1000

  belongs_to :topic_learning

  delegate :name, :student, :to => :topic_learning
  delegate :name, :username, :unit_code, :to => :student, :prefix => true

  scope :duration, lambda {|compare, seconds, start_month, end_month| during_month(start_month, end_month).
    where("topic_learning_id IN (#{during_month(start_month, end_month).
    select('topic_learning_id').group('topic_learning_id').having("sum(seconds) #{compare} #{seconds}").to_sql})")}
  scope :current, lambda { during_month(Time.now, Time.now).first || create }
  scope :during_month, lambda {|start_month, end_month| where :updated_at => 
    (start_month.beginning_of_month.beginning_of_day..end_month.end_of_month.end_of_day) }

  def heartbeat
    if continued?
      update_attribute :seconds, lasted_seconds
    else
      touch
    end
  end

  def lasted_seconds
    seconds + (Time.now - updated_at)
  end

  def continued?
    Time.now - 2.5 * INTERVAL_MINUTES.minutes < updated_at
  end
end
