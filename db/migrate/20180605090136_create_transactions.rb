class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :sender_id, foreign_key: true
      t.integer :receiver_id, foreign_key: true
      t.text :token
      t.integer :status, default: 0
      t.text :from_eth
      t.text :to_eth
      t.integer :amount
      t.float :cost

      t.timestamps
    end
  end
end
