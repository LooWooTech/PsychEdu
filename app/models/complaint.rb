class Complaint < ActiveRecord::Base
  belongs_to :complainable, :polymorphic => true
  belongs_to :complainer, :class_name => 'User'
end
