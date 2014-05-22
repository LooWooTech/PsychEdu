class AddVoteScoreToQuestionsAndAnswers < ActiveRecord::Migration
  def change
    add_column :questions, :vote_score, :integer, :default => 0
    add_column :answers, :vote_score, :integer, :default => 0
  end
end
