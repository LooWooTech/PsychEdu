class BlogArticle < ActiveRecord::Base
  belongs_to :writer, :class_name => 'Student'

  validates :title, :presence => true
  validates :content, :presence => true
end
