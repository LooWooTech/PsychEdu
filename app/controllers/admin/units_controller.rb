module Admin
  class UnitsController < AdminController
    before_filter :find_chapter, :only => [:new, :create]
    before_filter :find_unit, :only => [:edit, :update, :show, :destroy]

    def new
      @unit = Unit.new
    end

    def create
      @unit = @chapter.units.build unit_params
      if @unit.save
        redirect_to @unit
      else
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      if @unit.update_attributes unit_params
        redirect_to @unit
      else
        render :new
      end
    end

    def show; end

    def destroy
      @unit.destroy
      redirect_to @unit.chapter
    end

    private

    def unit_params
      params.require(:unit).permit(:name, :videos_attributes => [:url, :teacher_names, :_destroy, :id])
    end

    def find_unit
      @unit = Unit.find params[:id]
    end

    def find_chapter
      @chapter = Chapter.find params[:chapter_id]
    end
  end
end
