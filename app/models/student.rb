class Student < ActiveRecord::Base

  GENDER = {'男' => 0, '女' => 1, '保密' => 2}
  PROVINCES = %w[
    北京 天津 上海 重庆
    河北 山西 辽宁 吉林
    黑龙江 江苏 浙江 安徽
    福建 江西 山东 河南
    湖北 湖南 广东 海南
    四川 贵州 云南 陕西
    甘肃 青海 台湾 内蒙
    广西 西藏 宁夏 新疆
    香港 澳门
  ].freeze

  include HasAnAccount

  has_many :questions, 
    :as => 'questioner', :foreign_key => :questioner_id,
    :dependent => :nullify

  has_many :answers,
    :as => 'answerer', :foreign_key => :answerer_id,
    :dependent => :nullify

  has_many :comments,
    :as => 'commenter', :foreign_key => :commenter_id,
    :dependent => :nullify

  has_many :complaints,
    :as => 'complainer', :foreign_key => :complainer_id,
    :dependent => :nullify

  has_many :topic_learnings, :dependent => :destroy
  has_many :unit_exams, :through => :topic_learnings
  has_many :answer_votes, :as => :voter, :dependent => :destroy

  belongs_to :added_by, :class_name => 'Administrator'

  validates :name, :unit_code, :presence => true

  def added_by_username
    added_by.try(:username) || '无'
  end

  def change_current_topic_learning(topic_learning)
    transaction do
      current_topic_learning.update_attribute :current, false
      topic_learning.update_attribute :current, true
    end
  end

  def ongoing_topic_learnings
    topic_learnings.select &:ongoing?
  end

  def current_topic_learning
    topic_learnings.where(:current => true).first || topic_learnings.order('created_at ASC').first
  end

  def no_topic_open?
    topic_learnings.empty?
  end

end
