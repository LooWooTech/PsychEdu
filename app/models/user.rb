class User < ActiveRecord::Base

  has_many :questions, :foreign_key => :questioner_id
  has_many :answers, :foreign_key => :answerer_id
  has_many :comments, :foreign_key => :commenter_id
  has_many :complaints, :foreign_key => :complainer_id

  def fourm_admin?(forum)
    true
  end
  
end
