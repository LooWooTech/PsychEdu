class Forum < ActiveRecord::Base
  belongs_to :catalog, :class_name => 'ForumCatalog'

  acts_as_paranoid
end
