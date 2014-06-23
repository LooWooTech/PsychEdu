module Learning
  class PasswordsController < LearningController
    belongs_to_module :personal

    skip_before_action :ensure_topic_open
    skip_before_action :ensure_topic_learning_is_ongoing

    def edit; end

    def update
      if current_user.change_password password_params
        sign_out
        redirect_to learning_root_path
      else
        render :edit
      end
    end

    private

    def password_params
      params.require(:account).permit(:old_password, :password, :password_confirmation)
    end
  end
end
