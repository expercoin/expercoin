class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.string :eth_amount
      t.integer :sender_id, foreign_key: true
      t.integer :receiver_id, foreign_key: true
      t.integer :parent_id, foreign_key: true
      t.integer :request_id, foreign_key: true
      t.integer :usd_amount
      t.integer :status, default: 0
      t.text :from_eth
      t.text :block_number
      t.text :to_eth
      t.text :tx_hash
      t.index :tx_hash, unique: true

      t.timestamps
    end
  end
end
