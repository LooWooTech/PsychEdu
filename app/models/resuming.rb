class Resuming < ActiveRecord::Base
  belongs_to :leaving_period
  belongs_to :reviewer
end
