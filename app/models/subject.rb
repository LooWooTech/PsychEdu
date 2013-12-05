class Subject < ActiveRecord::Base
  has_many :subject_learnings, :dependent => :destroy
end
