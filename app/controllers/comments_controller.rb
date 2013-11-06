class CommentsController < ApplicationController

  before_filter :find_commentable, :only => [:index, :create]

  def index
    render :partial => 'comments/list', :locals => {:commentable => @commentable}
  end

  def create
    @comment = current_user.comments.build comment_params
    @comment.commentable = @commentable
    if @comment.save
      render :partial => 'comments/list_item', :locals => {:comment => @comment, :commentable => @commentable}
    else
      render :text => '评论创建失败', :status => 400
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    authorize! :destroy, @comment
    @comment.destroy
    render :nothing => true
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable = find_polymorphic_parent
  end
end
