class Complaint < ActiveRecord::Base
  belongs_to :complainable, :polymorphic => true
  belongs_to :complainer, :polymorphic => true
end
