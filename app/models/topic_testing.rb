class TopicTesting < ActiveRecord::Base
  belongs_to :topic

  has_many :score_rules, :dependent => :destroy

  validates :topic_id, :uniqueness => true, :presence => true
  validates :title, :presence => true

  delegate :name, :to => :topic, :prefix => true

  accepts_nested_attributes_for :score_rules,
    :reject_if => lambda{|attr| attr[:name].blank? || attr[:description].blank?},
    :allow_destroy => true
end
