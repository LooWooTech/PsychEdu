class QuestionsController < ApplicationController

  before_filter :find_my_question, :only => [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.build
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
    render :new
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

  private

  def question_params
    params.require(:question).permit!
  end

  def find_my_question
    @question = current_user.questions.find params[:id]
  end

end
