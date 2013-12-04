class Student < ActiveRecord::Base

  GENDER = {:male => 0, :female => 1, :secret => 2}

  include HasAnAccount

  has_many :questions, 
    :as => 'questioner', :foreign_key => :questioner_id,
    :dependent => :nullify

  has_many :answers,
    :as => 'answerer', :foreign_key => :answerer_id,
    :dependent => :nullify

  has_many :comments,
    :as => 'commenter', :foreign_key => :commenter_id,
    :dependent => :nullify

  has_many :complaints,
    :as => 'complainer', :foreign_key => :complainer_id,
    :dependent => :nullify

  has_many :course_learnings, :dependent => :destroy

  belongs_to :added_by, :class_name => 'Administrator'

  validates :name, :presence => true
  validates :gender, :presence => true
  validates :unit_code, :presence => true

end
