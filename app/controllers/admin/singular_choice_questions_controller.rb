module Admin
  class SingularChoiceQuestionsController < AdminController
    before_action :find_question

    def edit; end

    def update
      if @question.update_attributes question_params
        flash[:notice] = '保存成功'
        redirect_to edit_singular_choice_question_path(@question)
      else
        render :edit
      end
    end

    private

    def find_question
      @question = SingularChoiceQuestion.find params[:id]
    end

    def question_params
      params.require(:singular_choice_question).permit(:content, :choices_attributes => [:id, :content])
    end
  end
end
