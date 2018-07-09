class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :resource_id
      t.string  :resource_type
      t.string :title
      t.string :content
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
