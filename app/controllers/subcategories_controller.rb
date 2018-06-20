class SubcategoriesController < ApplicationController
  before_action :set_category, :set_profiles
  layout 'dashboard'

  def show
    @subcategories = category.categories
  end

  private

  attr_reader :category, :subcategory

  def set_profiles
    @profiles = subcategory.profiles
                           .except(current_user.try(:profile))
                           .page(params[:page]).per(9)
  end

  def set_category
    @category = Category.main.friendly.find(params[:category_id])
    @subcategory = category.categories.children.friendly.find(params[:subcategory_id])
  end
end
