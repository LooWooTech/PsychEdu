class FileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}_#{mounted_as}/#{model.created_at.to_i.to_s[-4, 4]}/#{model.id}"
  end

end
