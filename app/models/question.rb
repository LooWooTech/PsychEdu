class Question < ActiveRecord::Base
  belongs_to :questioner, :class_name => 'User'

  validates :title, :presence => true, :length => {:maximum => 140}
  validates :content, :presence => true
end
