module Period
  extend ActiveSupport::Concern

  included do
    validate :should_not_shorter_than_30_days
  end

  def include_date?(date)
    start_on <= date && actually_end_on >= date
  end

  def intersected?(period)
    (start_on..actually_end_on).cover?(period.start_on) ||
    (start_on..actually_end_on).cover?(period.actually_end_on) ||
    ((period.start_on..period.actually_end_on).cover?(start_on) &&
    (period.start_on..period.actually_end_on).cover?(actually_end_on))
  end

  def duration
    actually_end_on - start_on + 1
  end

  private

  def should_not_shorter_than_30_days
    errors.add(:base, :shorter_than_30_days) if end_on - start_on + 1 < 30
  end

end
