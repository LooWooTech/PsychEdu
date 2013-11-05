class QuestionCommentsController < ApplicationController

  load_resource :question

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

  def destroy
    @comment = @question.comments.find params[:id]
    authorize! :destroy, @comment
    @comment.destroy
    render :nothing => true
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
