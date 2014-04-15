module Admin
  class StudentsController < AdminController
    before_action :find_student, :only => [:show, :edit, :update]

    def index
      @search = Student.search params[:q]
      @students = @search.result.page(params[:page]).per(10)
      respond_to do |format|
        format.html
        format.csv { send_data StudentExporter.new(@search.result).export }
      end
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
      @topic_learning = TopicLearning.new
      @topic_learning.learning_periods.build
      @unopen_topics = Topic.unopen_for(@student)
    end

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

    def destroy
      @student = Student.find params[:id]
      @student.destroy
      flash[:notice] = "学员#{@student.name}已经被删除"
      redirect_to students_path
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
