class ServicesUploader < BaseUploader
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

  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "service.jpg"].compact.join('_'))
  end

  process resize_to_fit: [1200, 1000]

  version :medium do
    process resize_to_fill: [600, 400]
  end

  version :thumb do
    process resize_to_fill: [300, 200]
  end
end
