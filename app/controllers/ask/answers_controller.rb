module Ask
  class AnswersController < AskController
  
    load_resource :question, :only => :create
    load_and_authorize_resource :only =>[:edit, :update, :destroy]
  
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
        render :partial => 'ask/questions/answer', :object => @answer
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
      params.require(:answer).permit(:content)
    end
  
  end
end
