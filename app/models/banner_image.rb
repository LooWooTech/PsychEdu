class BannerImage < ActiveRecord::Base
  mount_uploader :file, BannerUploader

  belongs_to :setting

  def url
    file.url
  end
end
