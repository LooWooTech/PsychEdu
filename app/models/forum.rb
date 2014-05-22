class Forum < ActiveRecord::Base
  belongs_to :catalog, :class_name => 'ForumCatalog'

  has_many :questions

  validates :name, :presence => true

  acts_as_paranoid

  scope :uncataloged, lambda { where :catalog_id => nil }

  def catalog_name
    catalog ? catalog.name : '无'
  end
end
