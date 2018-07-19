class AddFirstTimeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_time, :boolean, default: true
  end
end
