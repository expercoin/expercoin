class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :message
      t.integer :rate
      t.integer :profile_id
      t.integer :author_id
      t.integer :request_id

      t.timestamps
    end
  end
end
