class Administrator < ActiveRecord::Base

  ROLES = {
    'super_admin' => '超级管理员',
    'unit_admin' => '单位管理员',
    'expert' => '专家'
  }

  has_many :added_students, :class_name => 'Student', :foreign_key => 'added_by_id', :dependent => :nullify
  has_many :announcements, :foreign_key => 'publisher_id', :dependent => :nullify
  has_many :topic_materials, :foreign_key => 'created_by_id', :dependent => :nullify
  has_many :published_articles, :class_name => 'Article', :foreign_key => 'editor_id', :dependent => :nullify
  has_many :uploaded_images, :class_name => 'Image', :foreign_key => :uploader_id, :dependent => :nullify
  has_many :answers, :as => :answerer, :dependent => :nullify
  has_many :comments, :as => :commenter, :dependent => :nullify
  has_many :complaints, :as => :complainer, :dependent => :nullify

  serialize :roles, Array

  include HasAnAccount

  def role_names
    roles.map{|role| ROLES[role]}
  end
  
  def fourm_admin?(forum)
    true
  end

  def has_role?(role_name)
    roles.include? role_name.to_s
  end

  def name
    username
  end

  def note
    '管理员'
  end

end
