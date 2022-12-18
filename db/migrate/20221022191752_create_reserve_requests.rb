class CreateReserveRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :reserve_requests do |t|
      t.boolean :approval_state
      t.timestamp :start_date
      t.timestamp :finish_date

      t.timestamps
    end
  end
end
