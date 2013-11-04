class Question < ActiveRecord::Base
  belongs_to :questioner, :class_name => 'User'
  belongs_to :forum

  has_many :answers
  has_many :comments, :as => :commentable

  validates :title, :presence => true, :length => {:maximum => 140}
  validates :content, :presence => true

  def no_answer?
    answers.empty?
  end

  def toggle_top
    update_attribute :top, !top?
  end

  def toggle_refined
    update_attribute :refined, !refined?
  end

  class << self
    def top
      where :top => true
    end

    def nontop
      where :top => false
    end
  end
end
