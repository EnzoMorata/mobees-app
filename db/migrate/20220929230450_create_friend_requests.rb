class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.string :issuing_name
      t.string :rereceiver_name
      t.string :status

      t.timestamps
    end
  end
end
