module Learning
module PeriodsHelper
  def review_state(reviewable)
    raw "<span>#{t "period.review_state.#{reviewable.review_state}"}</span>"
  end
end
end
