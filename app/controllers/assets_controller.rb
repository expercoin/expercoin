class AssetsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def create
    @asset = current_user.assets.new(asset_params)
    @asset.name = asset_params[:file].original_filename
    @asset.save
  end

  private

  def asset_params
    params.require(:asset).permit(:file)
  end
end 
