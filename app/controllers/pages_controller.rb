class PagesController < ApplicationController
  def index; end
  def show; end

  def business_home
    @categories = Category.main
    @services = Service.published.featured
  end
  
  def mentors_home

  end  
end
