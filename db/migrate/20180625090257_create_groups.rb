class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :parent_id
      t.string :title
      t.string :subtitle
      t.string :icon_static
      t.string :icon_active
      t.text :summary
      t.string :cover

      t.timestamps
    end
  end
end
