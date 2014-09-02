module Admin
  class UnitExamsController < AdminController
    def index
      @student = Student.find params[:student_id]
      @unit_exams = @student.unit_exams.submitted
      respond_to do |format|
        format.html
        format.csv{ send_data UnitExamExporter.new(@unit_exams).export, :filename => URI.encode("单元练习-#{@student.name}.csv")}
      end
    end
  end
end
