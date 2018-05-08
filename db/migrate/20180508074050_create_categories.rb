class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name
      t.string :slug
      t.text :description
      t.text :banner
      t.text :logo
      t.text :hover_logo
      t.timestamps
    end
  end
end
