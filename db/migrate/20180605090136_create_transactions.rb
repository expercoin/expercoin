class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.decimal :eth_amount
      t.decimal :tx_cost
      t.integer :rate
      t.integer :sender_id, foreign_key: true
      t.integer :status, default: 0
      t.integer :usd_amount
      t.text :from_eth
      t.text :block_number
      t.text :to_eth
      t.text :tx_hash, unique: true

      t.timestamps
    end
  end
end
