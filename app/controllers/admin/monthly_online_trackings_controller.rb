module Admin
  class MonthlyOnlineTrackingsController < AdminController
    def index
      params[:year] ||= Date.today.year
      if params[:month].present?
        @start = @end = Date.new params[:year].to_i, params[:month].to_i
      else
        @start = Date.new params[:year].to_i, 1
        @end = Date.new params[:year].to_i, 12
      end
      params[:compare] ||= '>='
      params[:hours] ||= 0
      @search = current_user.monthly_online_trackings.duration(params[:compare], params[:hours].to_f.hours, @start, @end).search params[:q]
      @table = Kaminari.paginate_array(@search.result.group_by(&:topic_learning).to_a).page(params[:page]).per(10)
    end
  end
end
