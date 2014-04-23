class Administrator < ActiveRecord::Base

  has_many :added_students, :class_name => 'Student', :foreign_key => 'added_by_id'
  has_many :announcements, :dependent => :destroy, :foreign_key => 'publisher_id'

  include HasAnAccount
  
  def fourm_admin?(forum)
    true
  end

end
