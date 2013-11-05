class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, :class_name => 'User'

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :complaints, :as => :complainable, :dependent => :destroy

  validates :content, :presence => true
end
