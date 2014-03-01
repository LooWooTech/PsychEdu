module Admin
  class TopicsController < AdminController

    before_action :find_topic, :only => [:show, :edit, :update, :destroy]

    def new
      @topic = Topic.new
    end

    def create
      @topic = Topic.new topic_params
      if @topic.save
        redirect_to @topic
      else
        render :new
      end
    end

    def index
      @topics = Topic.page(params[:page]).per(10)
    end

    def show; end

    def edit
      render :new
    end

    def update
      if @topic.update_attributes topic_params
        redirect_to @topic
      else
        render :new
      end
    end

    def destroy
      @topic.destroy
      redirect_to topics_path
    end

    private

    def topic_params
      params.require(:topic).permit(:name, :introduction, :guide_video_url, :review_video_url)
    end

    def find_topic
      @topic = Topic.find params[:id]
    end
  end
end
