class AnswersController < ApplicationController

  def create
    @question = Question.find params[:question_id]
    @answer = current_user.answers.build(answer_params.merge :question => @question)

    if @answer.save
      redirect_to @question
    else
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
