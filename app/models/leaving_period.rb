class LeavingPeriod < ActiveRecord::Base
  include Period
  include Reviewable

  belongs_to :learning_period
  has_one :resuming, :dependent => :destroy

  validate :should_start_during_learning_period

  def resume(date)
    create_resuming :date => date
  end

  def actually_end_on
    resuming.try(:date) || end_on
  end

  private

  def should_start_during_learning_period
    errors.add(:start_on, "should start during learning period") unless learning_period.include_date? start_on
  end
end
