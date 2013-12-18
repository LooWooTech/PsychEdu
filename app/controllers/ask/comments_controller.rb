module Ask
  class CommentsController < AskController
    include ::CommentsController

    def index
      render :partial => 'comments', :locals => {:commentable => @commentable}
    end

    private

    def find_commentable
      @commentable = find_polymorphic_parent
    end
    
  end
end
