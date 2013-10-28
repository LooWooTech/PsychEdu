class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, :class_name => 'User'

  validates :content, :presence => true
end
