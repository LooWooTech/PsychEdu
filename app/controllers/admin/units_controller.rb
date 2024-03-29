module Admin
  class UnitsController < AdminController
    before_action :find_chapter, :only => [:new, :create]
    before_action :find_unit_and_authorize, :only => [:edit, :update, :show, :destroy]
    before_action :find_unit, :only => [:import_questions]

    def new
      authorize :unit
      @unit = @chapter.units.build
    end

    def create
      authorize :unit
      @unit = @chapter.units.build unit_params
      if @unit.save
        redirect_to [:admin, @unit]
      else
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      if @unit.update_attributes unit_params
        redirect_to [:admin, @unit]
      else
        render :new
      end
    end

    def show; end

    def destroy
      @unit.destroy
      redirect_to [:admin, @unit.chapter]
    end

    def import_questions
      authorize @unit, :edit?
      @importer = QuestionImporter.new(@unit, params[:file].path)
      flash[:notice] = @importer.result
      redirect_to [:admin, @unit]
    end

    private

    def unit_params
      params.require(:unit).permit(
        :name, :singular_choice_count, 
        :multiple_choice_count, :case_count,
        :exam_minutes, :summary, :review,
        :videos_attributes => [:url, :teacher_names, :_destroy, :id, :name]
      )
    end

    def find_unit
      @unit = Unit.find params[:id]
    end

    def find_unit_and_authorize
      authorize find_unit
    end

    def find_chapter
      @chapter = Chapter.find params[:chapter_id]
    end
  end
end
