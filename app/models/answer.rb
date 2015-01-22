class Answer < ActiveRecord::Base
  include HasManyAttachments

  belongs_to :question
  belongs_to :answerer, :polymorphic => true

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :complaints, :as => :complainable, :dependent => :destroy
  has_many :votes, :class_name => 'AnswerVote', :dependent => :destroy

  validates :content, :presence => true

  delegate :name, :to => :answerer, :prefix => true
  delegate :can_interact_with?, :to => :question

  def calculate_vote_score
    update_attribute :vote_score, votes.up.count
    question.calculate_vote_score
  end

end
