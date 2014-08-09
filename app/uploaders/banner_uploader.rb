class BannerUploader < FileUploader
  storage :file

  process :resize_to_fill => [1024, 340]
end
