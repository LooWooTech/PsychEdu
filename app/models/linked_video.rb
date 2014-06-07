class LinkedVideo < ActiveRecord::Base
  belongs_to :master, :polymorphic => true

  validates :name, :presence => true
  validates :url, :presence => true
end
