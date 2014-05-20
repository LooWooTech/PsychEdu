class Question < ActiveRecord::Base
  belongs_to :questioner, :polymorphic => true
  belongs_to :forum

  has_many :answers, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :complaints, :as => :complainable, :dependent => :destroy

  validates :title, :presence => true, :length => {:maximum => 140}
  validates :content, :presence => true

  scope :top, -> {where :top => true}
  scope :nontop, -> {where :top => false}

  delegate :name, :to => :questioner, :prefix => true

  def no_answer?
    answers.empty?
  end

  def toggle_top
    update_attribute :top, !top?
  end

  def toggle_refined
    update_attribute :refined, !refined?
  end

  def calculate_vote_score
    update_attribute :vote_score, answers.sum(:vote_score)
  end

end
