module Reviewable
  STATE = {:unreviewed => 0, :accepted => 1, :rejected => 2}
  extend ActiveSupport::Concern
  included do
    belongs_to :reviewer, :class_name => 'Administrator'
  end
end
