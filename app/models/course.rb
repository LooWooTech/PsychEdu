class Course < ActiveRecord::Base
  has_many :course_learnings, :dependent => :destroy
end
