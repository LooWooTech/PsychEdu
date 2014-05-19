class Forum < ActiveRecord::Base
  belongs_to :catalog, :class_name => 'ForumCatalog'

  validates :name, :presence => true

  acts_as_paranoid

  def catalog_name
    catalog ? catalog.name : '无'
  end
end
