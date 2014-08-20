module Admin
  class TopicsController < AdminController

    before_action :find_topic_and_authorize, :only => [:show, :edit, :update, :destroy]

    def new
      authorize :topic
      @topic = Topic.new
    end

    def create
      authorize :topic
      @topic = Topic.new topic_params
      if @topic.save
        redirect_to [:admin, @topic]
      else
        render :new
      end
    end

    def index
      authorize :topic
      @topics = Topic.page(params[:page]).per(10)
    end

    def show; end

    def edit
      render :new
    end

    def update
      if @topic.update_attributes topic_params
        redirect_to [:admin, @topic]
      else
        render :new
      end
    end

    def destroy
      @topic.destroy
      redirect_to admin_topics_path
    end

    private

    def topic_params
      params.require(:topic).permit(:name, :introduction, :guide_video_url, :review_video_url, :supervision, :cover)
    end

    def find_topic_and_authorize
      @topic = Topic.find params[:id]
      authorize @topic
    end
  end
end
