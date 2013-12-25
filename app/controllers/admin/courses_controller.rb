module Admin
  class CoursesController < AdminController
    before_filter :find_topic, :only => [:new, :create]
    before_filter :find_course, :only => [:edit, :show, :update, :destroy]

    def new
      @course = Course.new
    end

    def create
      @course = @topic.courses.build course_params
      if @course.save
        redirect_to @course
      else
        render :new
      end
    end

    def show; end

    def edit
      render :new
    end

    def update
      if @course.update_attributes course_params
        redirect_to @course
      else
        render :new
      end
    end

    def destroy
      @course.destroy
      redirect_to @course.topic
    end

    private

    def find_course
      @course = Course.find params[:id]
    end

    def find_topic
      @topic = Topic.find params[:topic_id]
    end

    def course_params
      params.require(:course).permit(:name, :introduction)
    end
  end
end
