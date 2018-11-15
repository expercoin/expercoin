module Admin
  class ReleasesController < ApplicationController
    before_action :authenticate_admin_user!
    before_action :set_request, :set_expert_transaction, :set_site_transaction, :set_client_transaction

    def show
      @expert_address = @expert_transaction.to_eth
      @expert_amount = @expert_transaction.eth_amount
      @site_amount = @site_transaction.eth_amount
    end

    def withdraw
      @client_transaction = @request.eth_transaction.transactions.create(
        request: @request,
        receiver_id: @request.requester.user_id,
        tx_hash: params[:tx_hash],
        status: 'pending'
      )
      UpdateTransactionOnSuccessJob.perform_later(@client_transaction, 'destroy')
      redirect_to admin_release_path(@request)
    end

    def expert_payout
      @expert_transaction.update(tx_hash: params[:tx_hash])
      UpdateTransactionOnSuccessJob.perform_later(@expert_transaction, 'update')
      redirect_to admin_release_path(@request)
    end

    def site_payout
      @site_transaction.update(tx_hash: params[:tx_hash])
      UpdateTransactionOnSuccessJob.perform_later(@site_transaction, 'update')
      redirect_to admin_release_path(@request)
    end

    private

    def set_expert_transaction
      @expert_transaction = helpers.decorate(@request).expert_transaction
    end

    def set_site_transaction
      @site_transaction = helpers.decorate(@request).site_transaction
    end

    def set_client_transaction
      @client_transaction = helpers.decorate(@request).client_transaction
    end

    def set_request
      @request = Request.find(params[:id])
    end
  end
end
