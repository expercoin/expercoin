class Admin::ReleasesController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_request, :set_expert_transaction, :set_site_transaction

  def show
    @expert_address = @expert_transaction.to_eth
    @expert_amount = @expert_transaction.eth_amount
    @site_amount = @site_transaction.eth_amount
  end

  def create
  end

  private

  def set_expert_transaction
    @expert_transaction = Transaction.find_by(
      request: @request,
      receiver_id: @request.expert.user_id,
      parent_id: @request.eth_transaction.id
    )
  end

  def set_site_transaction
    @site_transaction = Transaction.find_by(
      request: @request,
      receiver_id: nil,
      parent_id: @request.eth_transaction.id
    )
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
