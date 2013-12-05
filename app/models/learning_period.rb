class LearningPeriod < ActiveRecord::Base
  include Period
  include Reviewable

  validate :should_not_intersect_with_other_learning_period

  has_many :leaving_periods, :dependent => :destroy
  belongs_to :subject_learning

  def actually_end_on
    end_on + leaving_periods.to_a.sum(&:duration)
  end

  def leave(start_on, end_on)
    leaving_periods.create(:start_on => start_on, :end_on => end_on)
  end

  def leaving?(date=Date.today)
    leaving_periods.any?{|period| period.include_date? date }
  end

  private

  def should_not_intersect_with_other_learning_period
    errors[:base] << 'should not intersect with another learning period' if subject_learning.has_intersected_learning_periods? self
  end

end
