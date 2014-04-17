module Learning
  class LearningPeriodsController < LearningController
    def destroy
      @period = LearningPeriod.find params[:id]
      @period.destroy
      flash[:notice] = '撤消成功'
      redirect_to periods_path
    end
  end
end
