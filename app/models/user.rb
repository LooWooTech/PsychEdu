class User < ActiveRecord::Base

  has_many :questions, :foreign_key => :questioner_id
end
