class DropAdminUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :admin_users
    drop_table :moderator_users
    drop_table :client_users
  end
end
