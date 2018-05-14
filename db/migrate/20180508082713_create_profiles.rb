class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :title
      t.integer :expercoin_rate
      t.integer :rate
      t.string :professional_role
      t.integer :years_of_experience
      t.string :photo
      t.string :slug
      t.text :location
      t.text :about
      t.text :specialization

      t.timestamps
    end
  end
end
