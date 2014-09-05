module Ask
  class QuestionsController < AskController
    belongs_to_module :forum
  
    load_and_authorize_resource :only => [:edit, :update, :destroy, :top, :refine]

    before_action :find_forum, :only => [:new, :create, :index]
  
    def index
      @top = Question.top
      @order = params[:order] || 'vote_score'
      @questions = Question.nontop.order("#@order DESC").page(params[:page]).per(10)
    end
  
    def new
      @title = '提问'
      @question = Question.new
      render :new, :layout => false
    end
  
    def create
      @question = @forum.questions.build question_params
      @question.questioner = current_user
      if @question.save
        redirect_to [:ask, @question]
      else
        render :new
      end
    end
  
    def show
      @question = Question.find params[:id]
      @order = params[:order] || 'vote_score'
      @answers = @question.answers.order("#@order DESC")
    end
  
    def edit
      render :new, :layout => false
    end
  
    def update
      if @question.update_attributes question_params
        redirect_to [:ask, @question]
      else
        render :new
      end
    end
  
    def destroy
      @question.destroy
      redirect_to ask_root_path
    end
  
    def top
      @question.toggle_top
      redirect_to [:ask, @question]
    end
  
    def refine
      @question.toggle_refined
      redirect_to [:ask, @question]
    end
  
    private
  
    def question_params
      params.require(:question).permit(:title, :content, :attachments_attributes => [:file, :_destroy, :id])
    end

    def find_forum
      @forum = Forum.find params[:forum_id] if params[:forum_id].present?
    end
  
  end
end
