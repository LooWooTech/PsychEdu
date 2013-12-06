module Admin
  class SubjectsController < AdminController
    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.new subject_params
      if @subject.save
        redirect_to subjects_path
      else
        render :new
      end
    end

    def index
      @subjects = Subject.page(params[:page]).per(10)
    end

    private

    def subject_params
      params.require(:subject).permit(:name, :introduction, :course_count, :length)
    end
  end
end
