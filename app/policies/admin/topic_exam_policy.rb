module Admin
  class TopicExamPolicy
    def initialize(user, topic_exam)
      @user = user
      @topic_exam = topic_exam
    end

    def index?
      @user.super_admin? || @user.unit_admin?
    end

    def review?
      @user.super_admin? || @user.expert?
    end
  end
end
