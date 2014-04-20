class LeavingPeriodResuming < PeriodApplication

  belongs_to :topic_learning
  belongs_to :leaving_period,
    :foreign_key => :parent_id

  validate :should_be_during_leaving_period

  scope :earliest, lambda { order('start_on ASC').first }

  private

  def should_be_during_leaving_period
    errors.add(:start_on, :out_of_range) unless topic_learning.leaving_period_include_date start_on
  end
end
