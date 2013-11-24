module Admin
  class StudentsController < AdminController
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

    def show
      @student = Student.find params[:id]
    end

    private

    def student_params
      params.require(:student).permit(
        :name, :gender, :unit_code, :note,
        :account_attributes => [:login, :password, :password_confirmation]
      )
    end
  end
end
