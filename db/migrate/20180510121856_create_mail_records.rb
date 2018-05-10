class CreateMailRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :mail_records do |t|
      t.integer :recipient_id
      t.integer :sender_id
      t.boolean :sent
      t.text :body
      t.text :meta
      t.string :subject
      t.string :mail_type

      t.timestamps
    end
  end
end
