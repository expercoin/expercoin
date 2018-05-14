class CreateEthAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :eth_addresses do |t|
      t.text :public_key
      t.belongs_to :wallet, foreign_key: true

      t.timestamps
    end
  end
end
