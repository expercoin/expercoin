class Admin::ReleasesController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_request, :set_expert_transaction, :set_site_transaction, :set_client_transaction

  def show
    @expert_address = @expert_transaction.to_eth
    @expert_amount = @expert_transaction.eth_amount
    @site_amount = @site_transaction.eth_amount
  end

  def withdraw
    @client_transaction = Transaction.create(
      request: @request,
      parent_id: @request.eth_transaction.id,
      receiver_id: @request.requester.user_id,
      tx_hash: params[:tx_hash],
      status: 'pending'
    )
    redirect_to admin_release_path(@request)
  end

  def expert_payout
    @expert_transaction.update(tx_hash: params[:tx_hash])
    redirect_to admin_release_path(@request)
  end

  def site_payout
    @site_transaction.update(tx_hash: params[:tx_hash])
    redirect_to admin_release_path(@request)
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

  def set_client_transaction
    @client_transaction = Transaction.find_by(
      request: @request,
      parent_id: @request.eth_transaction.id,
      receiver_id: @request.requester.user_id
    )
  end

  def set_request
    @request = Request.find(params[:id])
  end


end
