class SubcategoriesController < ApplicationController
  before_action :set_category
  before_action :set_subcategory, only: [:show]
  layout 'dashboard'

  def show
    @profiles = @subcategory.profiles.except(current_user&.profile)
                .page(params[:page]).per(9)
    @subcategories = @category.categories
  end

  private

  def set_category
    @category = Category.main.friendly.find(params[:category_id])
  end

  def set_subcategory
    @subcategory = @category.categories.children.friendly.find(params[:subcategory_id])
  end
end
