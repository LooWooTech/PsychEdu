class QuestionsController < ApplicationController

  load_and_authorize_resource :only => [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.build
    render :new, :layout => false
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
    render :new, :layout => false
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
    params.require(:question).permit(:title, :content)
  end

end
