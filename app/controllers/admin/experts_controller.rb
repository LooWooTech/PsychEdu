module Admin
  class ExpertsController < AdminController
    def index
      authorize :expert
      @experts = Administrator.expert
    end
  end
end
