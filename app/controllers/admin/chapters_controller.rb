module Admin
  class ChaptersController < AdminController
    before_filter :find_course, :only => [:new, :create]
    before_filter :find_chapter, :only => [:edit, :update, :show, :destroy]

    def new
      @chapter = Chapter.new
    end

    def create
      @chapter = @course.chapters.build chapter_params
      if @chapter.save
        redirect_to @chapter
      else
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      if @chapter.update_attributes chapter_params
        redirect_to @chapter
      else
        render :new
      end
    end

    def show; end

    def destroy
      @chapter.destroy
      redirect_to @chapter.course
    end

    private

    def chapter_params
      params.require(:chapter).permit(:name, :videos_attributes => [:url, :interaction_file, :teacher_names, :_destroy, :id])
    end

    def find_chapter
      @chapter = Chapter.find params[:id]
    end

    def find_course
      @course = Course.find params[:course_id]
    end
  end
end
