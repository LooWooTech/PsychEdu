class Video < ActiveRecord::Base
  belongs_to :chapter

  mount_uploader :interaction_file, VideoInteractionFileUploader

  validates :url, :uniqueness => {:scope => :chapter_id}
end
