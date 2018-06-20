class CategoriesController < ApplicationController
  before_action :set_category, :set_profiles, only: [:show]
  layout 'dashboard'

  def show
    @subcategories = category.categories
  end

  def index
    @categories = Category.main
  end

  private

  attr_reader :category, :subcategories, :profiles

  def set_profiles
    @profiles = category.children_profiles
                        .except(current_user.try(:profile))
                        .page(params[:page]).per(9)
  end

  def set_category
    @category = Category.main.friendly.find(params[:id])
  end
end
