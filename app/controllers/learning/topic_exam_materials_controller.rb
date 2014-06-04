module Learning
  class TopicExamMaterialsController < LearningController
    def create
      @topic_exam = TopicExam.find params[:topic_exam_id]
      @topic_exam_material = @topic_exam.materials.build material_params
      if @topic_exam_material.save
        redirect_to learning_exam_path
      else
        render :text => '上传失败', :status => 400
      end
    end

    def destroy
      @topic_exam_material = TopicExamMaterial.find params[:id]
      @topic_exam_material.destroy
      redirect_to learning_exam_path
    end

    private

    def material_params
      params.require(:topic_exam_material).permit(:note, :file)
    end
  end
end
