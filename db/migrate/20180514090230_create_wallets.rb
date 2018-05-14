class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.belongs_to :profile, foreign_key: true
      t.integer :balance

      t.timestamps
    end
  end
end
