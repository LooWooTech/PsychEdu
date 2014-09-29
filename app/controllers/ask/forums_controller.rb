module Ask
  class ForumsController < AskController
    belongs_to_module :forum
    def show
      @forum = Forum.find params[:id]
      @top = @forum.questions.top
      @order = params[:order] || 'vote_score'
      @questions = @forum.questions.nontop.order("#@order DESC").page(params[:page]).per(10)
      @setting =  Setting.load
      render 'ask/home/index'
    end
  end
end
