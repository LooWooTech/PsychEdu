module Admin
  class UnitExamsController < AdminController
    def index
      @student = Student.find params[:student_id]
      @unit_exams = @student.unit_exams.submitted
    end
  end
end
