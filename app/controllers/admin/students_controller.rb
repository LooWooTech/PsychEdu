module Admin
  class StudentsController < AdminController
    before_action :find_student, :only => [:show, :edit, :update]

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
      @topic_learning = TopicLearning.new
      @topic_learning.learning_periods.build
      @unopened_topics = Topic.unopened_for(@student)
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
