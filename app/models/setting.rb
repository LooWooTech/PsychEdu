class Setting < ActiveRecord::Base
  has_many :banner_images, :dependent => :destroy

  mount_uploader :forum_banner, ForumBannerUploader

  accepts_nested_attributes_for :banner_images, :update_only => true,
    :allow_destroy => true, :reject_if => lambda{|attrs| attrs[:file].blank? }

  class << self
    def load
      last
    end
  end
end
