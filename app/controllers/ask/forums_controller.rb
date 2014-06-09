module Ask
  class ForumsController < AskController
    def show
      @forum = Forum.find params[:id]
      @top = @forum.questions.top
      @order = params[:order] || 'vote_score'
      @questions = @forum.questions.nontop.order("#@order DESC").page(params[:page]).per(10)
      render 'ask/questions/index'
    end
  end
end