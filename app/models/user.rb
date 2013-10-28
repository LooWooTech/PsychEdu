class User < ActiveRecord::Base

  has_many :questions, :foreign_key => :questioner_id
  has_many :answers, :foreign_key => :answerer_id
end
