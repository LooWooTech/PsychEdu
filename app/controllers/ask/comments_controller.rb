module Ask
  class CommentsController < AskController
    belongs_to_module :forum
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
