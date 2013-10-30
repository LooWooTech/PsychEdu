class AnswersController < ApplicationController

  before_filter :find_question_and_answer, :only => [:edit, :update, :destroy]

  def create
    @question = Question.find params[:question_id]
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

  def find_question_and_answer
    @question = Question.find params[:question_id]
    @answer = current_user.answers.find params[:id]
  end
end
