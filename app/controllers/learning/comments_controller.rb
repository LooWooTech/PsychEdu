module Learning
  class CommentsController < LearningController
    include ::CommentsController

    def index
      @comments = @commentable.comments.page(params[:page]).per(5)
      render :partial => 'comments', :object => @comments, :locals => {:commentable => @commentable}
    end

    private

    def find_commentable
      @commentable = Video.find(params[:video_id])
    end
  end
end
