class Administrator < ActiveRecord::Base

  has_many :added_students, :class_name => 'Student', :foreign_key => 'added_by_id'
  has_many :announcements, :foreign_key => 'publisher_id', :dependent => :nullify
  has_many :topic_materials, :foreign_key => 'created_by_id', :dependent => :nullify
  has_many :published_articles, :class_name => 'Article', :foreign_key => 'editor_id', :dependent => :nullify
  has_many :uploaded_images, :class_name => 'Image', :foreign_key => :uploader_id, :dependent => :nullify
  has_many :answers, :as => :answerer
  has_many :comments, :as => :commenter
  has_many :complaints, :as => :complainer

  include HasAnAccount
  
  def fourm_admin?(forum)
    true
  end

  def name
    username
  end

  def note
    '管理员'
  end

end
