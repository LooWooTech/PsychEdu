class LearningPeriod < PeriodApplication
  include Period

  belongs_to :topic_learning, :inverse_of => :learning_periods

  has_many :leaving_periods,
    :foreign_key => :parent_id,
    :dependent => :destroy

  validates :topic_learning, :presence => true
  validate :should_not_intersect_with_other_learning_period

  def has_intersected_leaving_periods?(target)
    leaving_periods_intersected_with(target).any?
  end

  def leaving_periods_intersected_with(leaving_period)
    accepted_leaving_periods.select{|period| period != leaving_period && period.intersected?(leaving_period) }
  end

  def has_unreviewed_application?
    unreviewed? || leaving_periods.any?(&:has_unreviewed_application?)
  end

  def actually_end_on
    end_on + accepted_leaving_periods.to_a.sum(&:duration)
  end

  def accepted_leaving_periods
    leaving_periods.accepted
  end

  def leave(start_on, end_on)
    leaving_periods.create(:start_on => start_on, :end_on => end_on, :topic_learning => topic_learning)
  end

  def leaving?(date=Date.today)
    accepted_leaving_periods.any?{|period| period.include_date? date }
  end

  private

  def should_not_intersect_with_other_learning_period
    errors.add(:base, :conflict) if topic_learning.has_intersected_learning_periods? self
  end

end
