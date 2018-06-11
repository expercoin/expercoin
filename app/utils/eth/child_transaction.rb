# frozen_string_literal: true

module Eth
  class ChildTransaction
    EXPR_FEE = 0.07

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
        status: 'completed'
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

    def expercoin_amount_in_wei
      Eth::ValueFormatter.new(@parent.eth_amount).from_hex * EXPR_FEE
    end

    def expert_amount_in_wei
      Eth::ValueFormatter.new(@parent.eth_amount).from_hex - expercoin_amount_in_wei
    end

    def expercoin_amount
      Eth::ValueFormatter.new(expercoin_amount_in_wei).to_hex
    end

    def expert_amount
      Eth::ValueFormatter.new(expert_amount_in_wei).to_hex
    end
  end
end
