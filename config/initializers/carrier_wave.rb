CarrierWave.configure do |config|
  config.remove_previously_stored_files_after_update = false
  config.root = Rails.root
end
