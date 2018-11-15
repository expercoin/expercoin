# frozen_string_literal: true

ActiveAdmin.register Request do
  scope :all
  scope('Draft', &:draft)
  scope('Pending', &:pending)
  scope('Accepted', &:accepted)
  scope('Rejected', &:rejected)
  scope('Completed', &:completed)
  scope('Upcoming', &:upcoming)
  scope('Expired', &:expired)
  scope('Closed', &:closed)
  scope('Completed Waiting For Release', &:completed)

  index do
    column :id
    column :message
    column :requested_length
    column :status
    column 'Requester', :requester do |r|
      full_name = "#{r.requester.first_name} #{r.requester.last_name}"
      link_to(full_name, profile_path(r.requester), target: '_blank')
    end
    column 'Expert', :expert do |r|
      full_name = "#{r.expert.first_name} #{r.expert.last_name}"
      link_to(full_name, profile_path(r.expert), target: '_blank')
    end
    actions
  end

  show do
    render 'release'
    default_main_content
  end

  controller do
    before_action :set_request,
                  :set_expert_transaction,
                  :set_site_transaction,
                  :set_client_transaction,
                  only: %i[show withdraw site_payout expert_payout]

    def show
      @expert_address = @expert_transaction.to_eth
      @expert_amount = @expert_transaction.eth_amount
      @site_amount = @site_transaction.eth_amount
    end

    private

    def set_expert_transaction
      @expert_transaction = helpers.decorate(resource).expert_transaction
    end

    def set_site_transaction
      @site_transaction = helpers.decorate(resource).site_transaction
    end

    def set_client_transaction
      @client_transaction = helpers.decorate(resource).client_transaction
    end

    def set_request
      @request = resource
    end
  end

  member_action :withdraw, method: :post do
    @client_transaction = @request.eth_transaction.transactions.create(
      request: @request,
      receiver_id: @request.requester.user_id,
      tx_hash: params[:tx_hash],
      status: 'pending'
    )
    UpdateTransactionOnSuccessJob.perform_later(@client_transaction, 'destroy')
    redirect_to action: :show
  end

  member_action :expert_payout, method: :post do
    @expert_transaction.update(tx_hash: params[:tx_hash])
    UpdateTransactionOnSuccessJob.perform_later(@expert_transaction, 'update')
    redirect_to action: :show
  end

  member_action :site_payout, method: :post do
    @site_transaction.update(tx_hash: params[:tx_hash])
    UpdateTransactionOnSuccessJob.perform_later(@site_transaction, 'update')
    redirect_to action: :show
  end
end
