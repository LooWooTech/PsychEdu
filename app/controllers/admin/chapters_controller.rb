module Admin
  class ChaptersController < AdminController
    before_action :find_topic, :only => [:new, :create]
    before_action :find_chapter_and_authorize, :only => [:edit, :show, :update, :destroy]

    def new
      authorize :chapter
      @chapter = Chapter.new
    end

    def create
      authorize :chapter
      @chapter = @topic.chapters.build chapter_params
      if @chapter.save
        redirect_to [:admin, @chapter]
      else
        render :new
      end
    end

    def show; end

    def edit
      render :new
    end

    def update
      if @chapter.update_attributes chapter_params
        redirect_to [:admin, @chapter]
      else
        render :new
      end
    end

    def destroy
      @chapter.destroy
      redirect_to [:admin, @chapter.topic]
    end

    private

    def find_chapter_and_authorize
      @chapter = Chapter.find params[:id]
      authorize @chapter
    end

    def find_topic
      @topic = Topic.find params[:topic_id]
    end

    def chapter_params
      params.require(:chapter).permit(:name, :introduction)
    end
  end
end
