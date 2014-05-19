class ForumCatalog < ActiveRecord::Base
  has_many :forums, :foreign_key => 'catalog_id', :dependent => :destroy

  validates :name, :presence => true

  acts_as_paranoid
end
