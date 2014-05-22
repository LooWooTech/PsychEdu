module Ask
  class AnswerVotesController < AskController
    def create
      @answer_vote = AnswerVote.new vote_params
      @answer_vote.voter = current_user
      if @answer_vote.save
        render :plain => @answer_vote.answer.vote_score
      else
        render :nothing => true, :status => 400
      end
    end

    private

    def vote_params
      params.require(:answer_vote).permit(:up, :answer_id)
    end
  end
end
