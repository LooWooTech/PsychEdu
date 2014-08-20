module Admin
  class HomeController < AdminController
    def index
      @unreviewed_period_application_count = current_user.managed_period_applications.unreviewed.count
    end
  end
end
