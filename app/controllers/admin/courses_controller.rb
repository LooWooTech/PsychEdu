module Admin
  class CoursesController < AdminController
    before_filter :find_subject, :only => [:new, :create]
    before_filter :find_course, :only => [:edit, :show, :update, :destroy]

    def new
      @course = Course.new
    end

    def create
      @course = @subject.courses.build course_params
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
      redirect_to @course.subject
    end

    private

    def find_course
      @course = Course.find params[:id]
    end

    def find_subject
      @subject = Subject.find params[:subject_id]
    end

    def course_params
      params.require(:course).permit(:name)
    end
  end
end
