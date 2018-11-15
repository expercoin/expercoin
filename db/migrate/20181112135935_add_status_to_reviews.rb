class AddStatusToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :status, :integer, default: 0
    add_column :reviews, :tx_hash, :string
    add_column :reviews, :description_hash, :string
  end
end
