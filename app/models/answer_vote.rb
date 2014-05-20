class AnswerVote < ActiveRecord::Base
  belongs_to :voter, :polymorphic => true
  belongs_to :answer

  after_create :update_vote_score

  validates :answer_id, :uniqueness => {:scope => [:voter_id, :voter_type]}

  scope :up, lambda{ where :up => true }
  scope :down, lambda{ where :up => false }

  def down?
    !up?
  end

  private

  def update_vote_score
    answer.calculate_vote_score
  end
end
