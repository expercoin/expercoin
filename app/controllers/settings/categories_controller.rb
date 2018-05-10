# frozen_string_literal: true

module Settings
  class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile
    layout 'profile'

    def index
      @categories = Category.children
      @profile_form = ProfileForm.new(@profile, category_ids: category_ids)
    end

    def create
      @profile_form = ProfileForm.new(profile_params)
      @profile_form.update_categories(@profile)
      redirect_to action: :index
    end

    private

    def profile_params
      params.require(:profile_form).permit(category_ids: [])
    end

    def set_profile
      @profile = current_user.profile
    end

    def category_ids
      @profile.categories.map(&:id)
    end
  end
end
