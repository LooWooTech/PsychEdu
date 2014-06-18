class Article < ActiveRecord::Base
  belongs_to :editor, :class_name => 'Administrator'
  has_many :videos, :class_name => 'LinkedVideo', :as => :master, :dependent => :destroy

  accepts_nested_attributes_for :videos,
    :reject_if => lambda{|attr| attr[:url].blank? || attr[:name].blank?},
    :allow_destroy => true

  validates :title, :presence => true
  validates :content, :presence => true
  delegate :name, :to => :editor, :prefix => true
end
