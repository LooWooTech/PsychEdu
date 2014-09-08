module Ask
  class AnswersController < AskController
    belongs_to_module :forum
  
    load_resource :question, :only => :create
    load_resource :only => :show
    load_and_authorize_resource :only =>[:edit, :update, :destroy]

    def show
      @question = @answer.question
    end
  
    def create
      @answer = current_user.answers.build(answer_params.merge :question => @question)
  
      if @answer.save
        redirect_to [:ask, @question]
      else
        render 'ask/questions/show'
      end
    end
  
    def edit
      render :edit, :layout => false
    end
  
    def update
      if @answer.update_attributes answer_params
        redirect_to [:ask, @answer.question]
      else
        render :edit
      end
    end
  
    def destroy
      @answer.destroy
      redirect_to [:ask, @answer.question]
    end
  
    private
  
    def answer_params
      params.require(:answer).permit(:content, :attachments_attributes => [:_destroy, :file, :id])
    end
  
  end
end
