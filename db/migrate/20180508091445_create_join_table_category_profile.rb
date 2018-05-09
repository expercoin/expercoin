class CreateJoinTableCategoryProfile < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :profiles do |t|
      t.index [:category_id, :profile_id], unique: true
      t.index [:profile_id, :category_id], unique: true
    end
  end
end
