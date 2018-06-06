class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :sender_id, foreign_key: true
      t.integer :eth_address_id, foreign_key: true
      t.datetime :date
      t.decimal :eth_amount
      t.integer :usd_amount
      t.integer :rate
      t.decimal :tx_cost
      t.integer :status, default: 0
      t.text :tx_hash, unique: true

      t.timestamps
    end
  end
end
