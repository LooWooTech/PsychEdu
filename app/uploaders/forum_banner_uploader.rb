class ForumBannerUploader < FileUploader
  storage :file
  process :resize_to_fill => [848, 120]
end
