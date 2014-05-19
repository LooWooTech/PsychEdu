class ForumCatalog < ActiveRecord::Base
  has_many :forums, :dependent => :destroy

  validates :name, :presence => true

  acts_as_paranoid
end
