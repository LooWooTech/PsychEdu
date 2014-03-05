module Admin
  class MultipleChoiceQuestionsController < AdminController
    before_action :find_question

    def edit
      render 'admin/singular_choice_questions/edit'
    end

    def update
      if @question.update_attributes question_params
        flash[:notice] = '保存成功'
        redirect_to edit_multiple_choice_question_path(@question)
      else
        render :edit
      end
    end

    private

    def find_question
      @question = MultipleChoiceQuestion.find params[:id]
    end

    def question_params
      params.require(:multiple_choice_question).permit(:content, :choices_attributes => [:id, :content])
    end
  end
end
