class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :first_name
      t.string :last_name
      t.string :title
      t.integer :rate

      t.timestamps
    end
  end
end
