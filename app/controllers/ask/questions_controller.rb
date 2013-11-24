module Ask
  class QuestionsController < AskController
  
    load_and_authorize_resource :only => [:edit, :update, :destroy, :top, :refine]
  
    def index
      @top = Question.top
      @questions = Question.nontop.page(params[:page]).per(10)
    end
  
    def new
      @title = '提问'
      @question = Question.new
      render :new, :layout => 'modal_box'
    end
  
    def create
      @question = current_user.questions.build question_params
      if @question.save
        redirect_to @question
      else
        render :new
      end
    end
  
    def show
      @question = Question.find params[:id]
    end
  
    def edit
      render :new, :layout => 'modal_box'
    end
  
    def update
      if @question.update_attributes question_params
        redirect_to @question
      else
        render :new
      end
    end
  
    def destroy
      @question.destroy
      redirect_to root_path
    end
  
    def top
      @question.toggle_top
      redirect_to @question
    end
  
    def refine
      @question.toggle_refined
      redirect_to @question
    end
  
    private
  
    def question_params
      params.require(:question).permit(:title, :content)
    end
  
  end
end
