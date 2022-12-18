class AddUserToReserveRequest < ActiveRecord::Migration[6.0]
  def change
    add_reference :reserve_requests, :user, null: false, foreign_key: true
    add_reference :reserve_requests, :publication, null: false, foreign_key: true
  end
end
