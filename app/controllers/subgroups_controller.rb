class SubgroupsController < ApplicationController
  before_action :set_group
  layout 'dashboard'

  def show
    @services = @group.services
  end

  private

  def set_group
    parent = Group.friendly.find(params[:group_id])
    @group = parent.subgroups.friendly.find(params[:id])
  end
end
