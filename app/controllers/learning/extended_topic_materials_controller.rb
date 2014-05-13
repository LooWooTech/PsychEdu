module Learning
  class ExtendedTopicMaterialsController < LearningController
    def index
      @materials = current_topic_learning.extended_topic_materials.order('created_at DESC').page(params[:page]).per(20)
    end

    def show
      @material = ExtendedTopicMaterial.find params[:id]
    end
  end
end
