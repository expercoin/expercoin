class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :parent_id
      t.integer :request_id
      t.string :title
      t.text :body
      t.boolean :unread, default: true

      t.timestamps
    end
  end
end
