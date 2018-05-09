class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @users = User.all.map(&:profile)
  end
  def index; end

  private

  def set_category
    @category = Category.main.friendly.find(params[:id])
  end
end
