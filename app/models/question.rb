class Question < ActiveRecord::Base
  belongs_to :questioner, :class_name => 'User'
  belongs_to :forum

  has_many :answers, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :complaints, :as => :complainable, :dependent => :destroy

  validates :title, :presence => true, :length => {:maximum => 140}
  validates :content, :presence => true

  scope :top, -> {where :top => true}
  scope :nontop, -> {where :top => false}

  def no_answer?
    answers.empty?
  end

  def toggle_top
    update_attribute :top, !top?
  end

  def toggle_refined
    update_attribute :refined, !refined?
  end

end
