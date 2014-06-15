class Image < ActiveRecord::Base
  belongs_to :uploader, :class_name => 'Administrator'

  mount_uploader :file, ImageUploader

  def url
    file ? file.url : ''
  end
end
