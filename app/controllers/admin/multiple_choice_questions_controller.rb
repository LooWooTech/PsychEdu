module Admin
  class MultipleChoiceQuestionsController < AdminController
    before_action :find_question_and_authorize

    def edit
      render 'admin/singular_choice_questions/edit'
    end

    def update
      if @question.update_attributes question_params
        flash[:notice] = '保存成功'
        redirect_to edit_admin_multiple_choice_question_path(@question)
      else
        render :edit
      end
    end

    def destroy
      if @question.published?
        render :status => 400, :text => '不允许删除'
      else
        flash[:notice] = '删除成功'
        @question.destroy
        redirect_to [:admin, @question.unit]
      end
    end

    private

    def find_question_and_authorize
      @question = MultipleChoiceQuestion.find params[:id]
      authorize @question.unit, :edit?
    end

    def question_params
      params.require(:multiple_choice_question).permit(:content, :choices_attributes => [:id, :content])
    end
  end
end
