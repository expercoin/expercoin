class AddMembersToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :caller, :boolean
    add_column :requests, :invitee, :boolean
  end
end
