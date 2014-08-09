module Admin
  class SettingsController < AdminController
    before_action :load_setting

    def edit; end

    def update
      if @setting.update_attributes setting_params
        flash[:notice] = '您更新了平台的设置'
        redirect_to edit_admin_setting_path
      else
        render :edit
      end
    end

    private

    def setting_params
      params.require(:setting).permit!
    end

    def load_setting
      @setting = Setting.load
    end
  end
end
