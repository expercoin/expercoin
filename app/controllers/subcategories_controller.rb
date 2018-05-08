class SubcategoriesController < ApplicationController
  before_action :set_category
  before_action :set_subcategory, only: [:show]

  def show; end

  private

  def set_category
    @category = Category.main.friendly.find(params[:category_id])
  end

  def set_subcategory
    @subcategory = Category.children.friendly.find(params[:subcategory_id])
  end
end
