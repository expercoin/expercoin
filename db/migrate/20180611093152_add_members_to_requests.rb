class AddMembersToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :caller, :boolean, default: false
    add_column :requests, :invitee, :boolean, default: false
  end
end
