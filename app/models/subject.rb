class Subject < ActiveRecord::Base
  has_many :subject_learnings, :dependent => :destroy
  has_many :courses, :dependent => :destroy

  validates :name, :uniqueness => true, :presence => true
end
