class TopicTesting < ActiveRecord::Base
  belongs_to :topic

  validates :topic_id, :uniqueness => true, :presence => true
  validates :title, :presence => true

  delegate :name, :to => :topic, :prefix => true
end
