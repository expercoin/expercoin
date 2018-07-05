class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.string :cover_image
      t.string :slug
      t.text :content
      t.belongs_to :category, foreign_key: true
      t.integer :status, default: 0
      t.integer :owner_id
      t.integer :expercoin_rate
      t.integer :rate
      
      t.timestamps
    end
  end
end
