class Course < ActiveRecord::Base
  belongs_to :subject
  has_many :chapters, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => {:scope => :subject_id}

  delegate :name, :to => :subject, :prefix => true
end
