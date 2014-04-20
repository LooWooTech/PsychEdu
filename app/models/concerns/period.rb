module Period
  extend ActiveSupport::Concern

  included do
    validate :should_not_shorter_than_30_days
  end

  def include_date?(date)
    start_on <= date && actually_end_on >= date
  end

  def intersected?(period)
    include_date?(period.start_on) ||
    include_date?(period.actually_end_on) ||
    cover?(period)
  end

  def cover?(period)
    include_date?(period.start_on) && include_date?(period.actually_end_on)
  end

  def duration
    actually_end_on - start_on + 1
  end

  private

  def should_not_shorter_than_30_days
    errors.add(:base, :should_not_shorter_than_30_days) if end_on - start_on + 1 < 30
  end

end
