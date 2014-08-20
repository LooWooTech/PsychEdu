module Admin
  class TopicTestingsController < AdminController
    before_action :find_topic_testing_and_authorize, :only => [:show, :edit, :update]

    def index
      authorize :topic_testing
      @topic_testings = TopicTesting.page(params[:paeg]).per(10)
    end

    def new
      authorize :topic_testing
      @topic_testing = TopicTesting.new
      @topics = Topic.no_testing
    end

    def create
      authorize :topic_testing
      @topic_testing = TopicTesting.new testing_params
      if @topic_testing.save
        flash[:notice] = '专题考核添加成功'
        redirect_to admin_topic_testings_path
      else
        render :new
      end
    end

    def show; end

    def edit
      @topics = Topic.no_testing << @topic_testing.topic
      render :new
    end

    def update
      if @topic_testing.update_attributes testing_params
        flash[:notice] = '专题考核修改成功'
        redirect_to admin_topic_testings_path
      else
        render :new
      end
    end

    private

    def find_topic_testing_and_authorize
      @topic_testing = TopicTesting.find params[:id]
      authorize @topic_testing
    end

    def testing_params
      params.require(:topic_testing).permit!
    end
  end
end
