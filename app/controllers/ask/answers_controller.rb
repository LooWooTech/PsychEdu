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
      if @question.can_interact_with? current_user
        @answer = current_user.answers.build(answer_params.merge :question => @question)
  
        if @answer.save
          redirect_to [:ask, @question]
        else
          render 'ask/questions/show'
        end
      else
        render :status => 403, :plain => '您没有权限回答该问题'
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
