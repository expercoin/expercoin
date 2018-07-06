class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.belongs_to :profile, foreign_key: true
      t.belongs_to :service, foreign_key: true
      
      t.timestamps
    end
  end
end
