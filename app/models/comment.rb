class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :commenter, :class_name => 'User'

  has_many :complaints, :as => :complainable, :dependent => :destroy

  validates :content, :presence => true
end
