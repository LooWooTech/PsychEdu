class CaseAnalysis < ActiveRecord::Base
  belongs_to :topic
  belongs_to :created_by, :class_name => 'Administrator'

  has_many :videos, :class_name => 'CaseVideo', :dependent => :destroy
  has_many :attachments, :class_name => 'CaseAttachment', :dependent => :destroy

  validates :title, :presence => true
  validates :content, :presence => true
  validates :topic_id, :presence => true
  validates :created_by_id, :presence => true

  accepts_nested_attributes_for :videos,
    :reject_if => lambda{|attr| attr[:url].blank? || attr[:name].blank?},
    :allow_destroy => true

  accepts_nested_attributes_for :attachments,
    :reject_if => lambda{|attr| attr[:file].blank? },
    :allow_destroy => true

end
