class News < ActiveRecord::Base
  include HasManyLinkedVideos
  belongs_to :editor, :class_name => 'Administrator'

  validates :title, :presence => true
  validates :content, :presence => true

  delegate :name, :to => :editor, :prefix => true

end
