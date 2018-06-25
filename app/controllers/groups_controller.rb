class GroupsController < ApplicationController
  before_action :set_group

  def show
    @subgroups = Group.where(parent: @group)
  end

  private

  def set_group
    @group = Group.friendly.find(params[:id])
  end
end
