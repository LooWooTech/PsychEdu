class AddSettingToBannerImage < ActiveRecord::Migration
  def change
    add_reference :banner_images, :setting, index: true
  end
end
