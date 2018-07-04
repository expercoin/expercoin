class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :message
      t.integer :session_length
      t.integer :requested_length
      t.string :cell_number
      t.integer :country_number
      t.date :first_date
      t.date :second_date
      t.date :third_date
      t.string :first_time
      t.string :second_time
      t.string :third_time
      t.datetime :selected_date
      t.boolean :recording
      t.integer :status, default: 0
      t.string :time_zone
      t.string :room_sid
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :requester_id
      t.integer :expert_id
      t.integer :updated_by_id
      t.string :tx_hash
      t.integer :service_id
      t.decimal :requested_amount_eth, precision: 36, scale: 18
      t.timestamps
    end
  end
end
