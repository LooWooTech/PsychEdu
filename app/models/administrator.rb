class Administrator < ActiveRecord::Base

  has_many :added_students, :class_name => 'Student', :foreign_key => 'added_by_id'
  has_many :announcements, :foreign_key => 'publisher_id', :dependent => :nullify
  has_many :case_analyses, :foreign_key => 'created_by_id', :dependent => :nullify

  include HasAnAccount
  
  def fourm_admin?(forum)
    true
  end

end
