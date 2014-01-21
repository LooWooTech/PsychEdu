module CommentsController

  extend ActiveSupport::Concern

  included do
    before_action :find_commentable, :only => [:index, :create]
  end
  
  def create
    @comment = current_user.comments.build comment_params
    @comment.commentable = @commentable
    if @comment.save
      render :partial => 'comment', :locals => {:comment => @comment}
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

end
