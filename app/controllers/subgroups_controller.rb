class SubgroupsController < ApplicationController
  before_action :set_group

  def show
  end

  private

  def set_group
    @group = Group.friendly.find(params[:id])
  end
end
