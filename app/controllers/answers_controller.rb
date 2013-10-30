class AnswersController < ApplicationController

  load_resource :question
  load_and_authorize_resource :answer, :through => :question, :only =>[:edit, :update, :destroy]

  def create
    @answer = current_user.answers.build(answer_params.merge :question => @question)

    if @answer.save
      redirect_to @question
    else
      render 'questions/show'
    end
  end

  def edit; end

  def update
    if @answer.update_attributes answer_params
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @question
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
