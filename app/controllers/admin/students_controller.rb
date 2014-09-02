module Admin
  class StudentsController < AdminController
    before_action :find_student_and_authorize, :only => [:show, :edit, :update, :destroy]

    def index
      @search = current_user.managed_students.search params[:q]
      @students = @search.result.order('created_at DESC').page(params[:page]).per(10)
      authorize :student
      respond_to do |format|
        format.html
        format.csv { send_data StudentExporter.new(@search.result).export, :filename => URI.encode("学员列表.csv") }
      end
    end

    def new
      authorize :student
      @student = Student.new
    end

    def create
      authorize :student
      @student = current_user.added_students.build student_params
      if @student.save
        redirect_to [:admin, @student]
      else
        render :new
      end
    end

    def show
      @topic_learning = TopicLearning.new
      @topic_learning.learning_periods.build
      @unopen_topics = Topic.unopen_for(@student)
    end

    def edit
      render :new
    end

    def update
      if @student.update_attributes student_params
        redirect_to [:admin, @student]
      else
        render :new
      end
    end

    def destroy
      @student.destroy
      flash[:notice] = "您删除了学员：#{@student.name}"
      redirect_to admin_students_path
    end

    private

    def student_params
      params.require(:student).permit!
    end

    def find_student_and_authorize
      @student = Student.find params[:id]
      authorize @student
    end
  end
end
