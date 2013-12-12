class Chapter < ActiveRecord::Base
  belongs_to :course

  has_many :videos, :dependent => :destroy

  delegate :name, :to => :course, :prefix => true

  validates :name, :uniqueness => {:scope => :course_id}

  accepts_nested_attributes_for :videos, 
    :reject_if => proc {|attrs| attrs['url'].blank?},
    :allow_destroy => true
end
