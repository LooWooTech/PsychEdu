module Admin
  class StudentsController < AdminController
    before_filter :find_student, :only => [:show, :edit, :update]

    def index
      @students = Student.page(params[:page]).per(10)
    end

    def new
      @student = Student.new
      @student.build_account
    end

    def create
      @student = current_user.added_students.build student_params
      if @student.save
        redirect_to @student
      else
        render :new
      end
    end

    def show; end

    def edit
      render :new
    end

    def update
      if @student.update_attributes student_params
        redirect_to @student
      else
        render :new
      end
    end

    private

    def student_params
      params.require(:student).permit(
        :name, :gender, :unit_code, :note, 
        :account_attributes => [:username, :password, :password_confirmation]
      )
    end

    def find_student
      @student = Student.find params[:id]
    end
  end
end
