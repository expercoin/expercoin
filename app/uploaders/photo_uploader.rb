class PhotoUploader < BaseUploader
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  process resize_to_fit: [800, 800]

  version :thumb do
    process resize_to_fill: [240,240]
  end

  version :badge do
    process resize_to_fill: [32,32]
  end
end
