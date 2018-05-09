class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @profiles = @category.children_profiles.except(current_user&.profile)
    @subcategories = @category.categories
  end

  def index
    @categories = Category.main
  end

  private

  def set_category
    @category = Category.main.friendly.find(params[:id])
  end
end
