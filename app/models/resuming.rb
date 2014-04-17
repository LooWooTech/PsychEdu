class Resuming < ActiveRecord::Base
  include PeriodApplication

  belongs_to :leaving_period
  belongs_to :reviewer

  scope :earliest, lambda { order("date ASC").first }

  validate :should_shoud_be_during_leaving_period

  private

  def should_shoud_be_during_leaving_period
    errors.add(:date, :out_of_range) unless leaving_period.include_date? date
  end
end
