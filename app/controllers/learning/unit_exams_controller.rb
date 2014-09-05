module Learning
  class UnitExamsController < LearningController
    belongs_to_module :learning
    before_action :find_unit_exam, :only => [:show, :update]
    after_action :destroy_unpassed_exam, :only => [:show, :update]

    def create
      @unit_learning = UnitLearning.find params[:unit_learning_id]
      if @unit_learning.exam_limited?
        render :plain => "您已经#{UnitLearning::EXAM_TIMES_LIMIT}次通过练习，无需继续练习。"
      else
        @unit_exam = @unit_learning.generate_exam
        redirect_to [:learning, @unit_exam]
      end
    end

    def show; end

    def update
      @unit_exam.update_attributes unit_exam_params
      if request.xhr?
        render :nothing => true, :status => 200
      else
        render :show
      end
    end

    private

    def unit_exam_params
      # 允许取消所有已经选择的多选题选项
      params[:unit_exam][:multiple_choice_answers_attributes].try(:each){|k, v| v[:choice_ids] ||=[]}

      params.require(:unit_exam).permit(
        :submitted,
        :singular_choice_answers_attributes => [:choice_id, :id],
        :multiple_choice_answers_attributes => [{:choice_ids => []}, :id]
      )
    end

    def find_unit_exam
      @unit_exam = UnitExam.find params[:id]
    end

    def destroy_unpassed_exam
      @unit_exam.destroy if @unit_exam.over? && !@unit_exam.passed?
    end
  end
end
