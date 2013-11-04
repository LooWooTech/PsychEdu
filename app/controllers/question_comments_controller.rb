class QuestionCommentsController < ApplicationController

  before_filter :find_question

  def index
    render :partial => 'comments/list', :locals => {:question => @question}
  end

  def create
    @comment = current_user.comments.build comment_params
    @comment.commentable = @question
    if @comment.save
      render :partial => 'comments/list_item', :locals => {:comment => @comment}
    else
      render :text => '评论创建失败', :status => 400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_question
    @question = Question.find params[:question_id]
  end
end
