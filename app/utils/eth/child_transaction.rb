# frozen_string_literal: true

module Eth
  class ChildTransaction
    EXPR_FEE = ENV['EXPERCOIN_RATE'].to_i / 100.0

    def initialize(parent)
      @parent = parent
    end

    def create_transactions
      Transaction.create(expercoin_tx_params)
      Transaction.create(expert_tx_params)
    end

    private

    def request
      @parent.request
    end

    def tx_params
      {
        request: request,
        status: 'pending',
        from_eth: @parent.to_eth,
        parent: @parent,
        sender: @parent.sender
      }
    end

    def expercoin_tx_params
      tx_params.merge(
        eth_amount: expercoin_amount,
        status: 'pending'
      )
    end

    def expert_tx_params
      tx_params.merge(
        receiver: request.expert.user,
        to_eth: default_expert_eth_address.public_key,
        eth_amount: expert_amount
      )
    end

    def default_expert_eth_address
      expert_eth_addresses.find_by(default: true) || expert_eth_addresses.last
    end

    def expert_eth_addresses
      request.expert.wallet.eth_addresses
    end

    def expercoin_amount
      (@parent.eth_amount * EXPR_FEE).round(18)
    end

    def expert_amount
      (@parent.eth_amount - expercoin_amount).round(18)
    end
  end
end
