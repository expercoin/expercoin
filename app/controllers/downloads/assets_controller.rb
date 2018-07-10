module Downloads
  class AssetsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_asset

    def show
      return unless @asset
      send_file @asset.file.path, filename: @asset.name, type: file_type, disposition: 'attachment'
    end

    private

    def set_asset
      @asset = Asset.find_by(id: params[:id])
      return set_message_asset if @asset.resource_type == 'Message'
      return set_user_asset if @asset.resource_type == 'User'
      @asset = nil
    end

    def set_message_asset
      @asset = nil unless @asset.resource.receiver = current_user
    end

    def set_user_asset
      @asset = nil unless @asset.resource = current_user
    end

    def file_type
      Rack::Mime.mime_type(File.extname(@asset.file.path))
    end

    def file_size
      File.size(@asset.file.path)
    end
  end
end 
