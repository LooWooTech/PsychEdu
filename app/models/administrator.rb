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
  has_many :questions, :as => :questioner, :dependent => :nullify
  has_many :answers, :as => :answerer, :dependent => :nullify
  has_many :comments, :as => :commenter, :dependent => :nullify
  has_many :complaints, :as => :complainer, :dependent => :nullify

  serialize :roles, Array

  include HasAnAccount

  ROLES.keys.each do |role_name|
    define_method "#{role_name}?" do
      roles.include? role_name.to_s
    end
  end

  def managed_period_applications
    return PeriodApplication.all if super_admin?
    return PeriodApplication.in_unit(unit_code) if unit_admin?
    PeriodApplication.where(:id => -1)
  end

  def managed_topic_learnings
    return TopicLearning.all if super_admin?
    return TopicLearning.in_unit(unit_code) if unit_admin?
    TopicLearning.where(:id => -1)
  end

  def managed_students
    return Student.all if super_admin?
    return Student.where(:unit_code => unit_code) if unit_admin?
    Student.where(:id => -1)
  end

  def monthly_online_trackings
    return MonthlyOnlineTracking.all if super_admin?
    return MonthlyOnlineTracking.in_unit(unit_code) if unit_admin?
    MonthlyOnlineTracking.where(:id => -1)
  end

  def role_names
    roles.map{|role| ROLES[role]}
  end
  
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
