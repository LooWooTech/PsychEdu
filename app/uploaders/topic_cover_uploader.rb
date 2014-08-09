class TopicCoverUploader < FileUploader
  storage :file
  process :resize_to_fill => [754, 298]
end
