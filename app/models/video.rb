class Video < ActiveRecord::Base
  belongs_to :unit

  mount_uploader :interaction_file, VideoInteractionFileUploader

  validates :url, :uniqueness => {:scope => :unit_id}
end
