module Ask
  class CommentsController < AskController
    belongs_to_module :forum
    include ::CommentsController

    def index
      render :partial => 'comments', :locals => {:commentable => @commentable}
    end

    def show
      @comment = Comment.find params[:id]
    end

    private

    def find_commentable
      @commentable = find_polymorphic_parent
    end
    
  end
end
