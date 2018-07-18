ActiveAdmin.register Transaction do
  scope :all
  scope('Parents') { |scope| scope.where(parent: nil) }
  scope('To Experts') { |scope| scope.where.not(receiver: nil) }
  scope('To Experts Pending') { |scope| scope.where.not(receiver: nil).pending }
  scope('To Experts Completed') { |scope| scope.where.not(receiver: nil).completed }
  scope('To Expercoin') { |scope| scope.where.not(parent: nil).where(receiver: nil) }

  permit_params(
    :tx_hash,
    :block_number,
    :status
  )

  index do
    selectable_column
    column :id
    column :parent
    column :sender
    column :receiver
    column :eth_amount do |transaction|
      transaction.eth_amount
    end
    column :created_at
    actions
  end
end
