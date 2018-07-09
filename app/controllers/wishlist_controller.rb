class WishlistController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def index
    @services = current_user.profile.wishlisted_services.page(params[:page]).per(15)
  end
  
  def create
    @service = Service.friendly.find(params["service_id"])
    wishlist = Wishlist.where(
      profile_id: current_user.profile.try(:id),
      service_id: @service.try(:id) 
    ).first
    if wishlist
      wishlist.destroy
    else
      Wishlist.create(
        profile_id: current_user.profile.try(:id),
        service_id: @service.try(:id)
      )
    end
    respond_to do |format|
      format.js
    end  
  end  
end 
