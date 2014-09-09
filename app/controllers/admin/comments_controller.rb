module Admin
  class CommentsController < AdminController

    before_action :find_comment_and_authorize, :only => [:show, :destroy]

    def index
      @search = Comment.search params[:q]
      @comments = @search.result.page(params[:page]).per(10)
    end

    def show; end

    def destroy
      @comment.destroy
      flash[:notice] = "您删除了 #{@comment.commenter_name} 的评论"
      redirect_to admin_comments_path
    end

    private

    def find_comment_and_authorize
      @comment = Comment.find params[:id]
      authorize @comment
    end
  end
end
