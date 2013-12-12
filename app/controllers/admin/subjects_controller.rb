module Admin
  class SubjectsController < AdminController

    before_filter :find_subject, :only => [:show, :edit, :update, :destroy]

    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.new subject_params
      if @subject.save
        redirect_to @subject
      else
        render :new
      end
    end

    def index
      @subjects = Subject.page(params[:page]).per(10)
    end

    def show; end

    def edit
      render :new
    end

    def update
      if @subject.update_attributes subject_params
        redirect_to @subject
      else
        render :new
      end
    end

    def destroy
      @subject.destroy
      redirect_to subjects_path
    end

    private

    def subject_params
      params.require(:subject).permit(:name, :introduction, :course_count, :length)
    end

    def find_subject
      @subject = Subject.find params[:id]
    end
  end
end
