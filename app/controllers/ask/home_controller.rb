module Ask
  class HomeController < AskController

    belongs_to_module :forum

    def index
      @top = Question.top
      @order = params[:order] || 'updated_at'
      @questions = Question.nontop.order("#@order DESC").page(params[:page]).per(10)
      @setting =  Setting.load
    end

  end
end
