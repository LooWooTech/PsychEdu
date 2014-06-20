class BlogArticle < ActiveRecord::Base
  belongs_to :author, :class_name => 'Student'

  validates :title, :presence => true
  validates :content, :presence => true

  scope :published, lambda { where :published => true }

  delegate :name, :to => :author, :prefix => true

  def publish!
    update_attribute :published, true
  end

  def un_publish!
    update_attribute :published, false
  end
end
