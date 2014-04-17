module PeriodApplication
  extend ActiveSupport::Concern
  included do
    enum :review_state => [:unreviewed, :accepted, :rejected]
    belongs_to :reviewer, :class_name => 'Administrator'
  end
end
