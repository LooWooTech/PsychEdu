class LeavingPeriod < PeriodApplication
  include Period

  belongs_to :topic_learning
  belongs_to :learning_period, :foreign_key => :parent_id

  has_many :resumings,
    :class_name => 'LeavingPeriodResuming',
    :foreign_key => :parent_id,
    :dependent => :destroy

  validate :should_start_during_learning_period
  validate :should_not_intersect_with_other_leaving_period
  validate :should_not_intersect_with_more_than_on_learning_period

  def has_unreviewed_application?
    unreviewed? || resumings.any?(&:unreviewed?)
  end

  def resume(date)
    resumings.create :start_on => date, :topic_learning => topic_learning
  end

  def actually_end_on
    resumed? ? accepted_resumings.earliest.start_on.yesterday : end_on
  end

  def resumed?
    accepted_resumings.any?
  end

  def accepted_resumings
    resumings.accepted
  end

  private

  def should_start_during_learning_period
    errors.add(:start_on, :out_of_range) if !learning_period.include_date? start_on
  end

  def should_not_intersect_with_other_leaving_period
    errors.add(:base, :conflict) if learning_period.has_intersected_leaving_periods? self
  end

  def should_not_intersect_with_more_than_on_learning_period
    tail_learning_period = topic_learning.learning_period_include_date(end_on)
    if tail_learning_period && tail_learning_period != learning_period
      errors.add(:base, :out_of_bound)
    end
  end
end
