class Announcement < ActiveRecord::Base
  belongs_to :topic
  belongs_to :publisher, :class_name => 'Administrator'

  delegate :username, :to => :publisher, :prefix => true
  delegate :name, :to => :topic, :prefix => true

  validates :title, :presence => true
  validates :content, :presence => true
end
