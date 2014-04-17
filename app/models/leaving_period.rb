class LeavingPeriod < ActiveRecord::Base
  include Period
  include PeriodApplication

  belongs_to :learning_period
  has_many :resumings, :dependent => :destroy

  validate :should_start_during_learning_period
  validate :should_not_intersect_with_other_leaving_period

  def has_unreviewed_application?
    unreviewed? || resumings.any?(&:unreviewed?)
  end

  def resume(date)
    resumings.create :date => date
  end

  def actually_end_on
    resumings.earliest.try(:date) || end_on
  end

  private

  def should_start_during_learning_period
    errors.add(:start_on, :out_of_range) unless learning_period.include_date? start_on
  end

  def should_not_intersect_with_other_leaving_period
    errors.add(:base, :conflict) if learning_period.has_intersected_leaving_periods? self
  end
end
