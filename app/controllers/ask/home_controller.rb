module Ask
  class HomeController < AskController

    belongs_to_module :forum

    def index
      @top = Question.top
      @order = params[:order] || 'vote_score'
      @questions = Question.nontop.order("#@order DESC").page(params[:page]).per(10)
      @setting =  Setting.load
    end

  end
end
