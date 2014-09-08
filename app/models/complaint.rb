class Complaint < ActiveRecord::Base

  STATE = {
    :unprocessed => 0,
    :processed => 1,
    :ignored => 2
  }

  belongs_to :complainable, :polymorphic => true
  belongs_to :complainer, :polymorphic => true

  scope :unprocessed, lambda { where :state => STATE[:unprocessed] }

  delegate :name, :to => :complainer, :prefix => true

  def process
    update_attribute :state, STATE[:processed]
  end

  def ignore
    update_attribute :state, STATE[:ignored]
  end

end
