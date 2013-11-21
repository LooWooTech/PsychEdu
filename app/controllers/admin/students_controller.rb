module Admin
  class StudentsController < AdminController
    def index
      @students = Student.page(params[:page]).per(10)
    end
  end
end
