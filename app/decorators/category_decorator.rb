class CategoryDecorator < BaseDecorator
  def category_icon
    ActionController::Base.helpers.image_tag(logo.url) unless logo.blank?
  end  
end  