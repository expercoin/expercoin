class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  layout 'dashboard'

  def show
    @profiles = @category.children_profiles
      .except(current_user&.profile).page(params[:page]).per(9)
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
