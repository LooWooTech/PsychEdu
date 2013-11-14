class AnswersController < ApplicationController

  load_resource :question, :only => :create
  load_and_authorize_resource :only =>[:edit, :update, :destroy]

  def create
    @answer = current_user.answers.build(answer_params.merge :question => @question)

    if @answer.save
      redirect_to @question
    else
      render 'questions/show'
    end
  end

  def edit
    render :edit, :layout => 'modal_box'
  end

  def update
    if @answer.update_attributes answer_params
      render :partial => 'questions/answer', :object => @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
