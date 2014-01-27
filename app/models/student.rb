class Student < ActiveRecord::Base

  GENDER = {'男' => 0, '女' => 1, '保密' => 2}

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

  belongs_to :added_by, :class_name => 'Administrator'

  validates :name, :presence => true
  validates :gender, :presence => true
  validates :unit_code, :presence => true

  def change_current_topic_learning(topic_learning)
    transaction do
      current_topic_learning.update_attribute :current, false
      topic_learning.update_attribute :current, true
    end
  end

  def current_topic_learning
    topic_learnings.where(:current => true).first || topic_learnings.order('created_at ASC').first
  end

  def no_topic_open?
    topic_learnings.empty?
  end

end
