class AddUserTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_type, :string
    change_column_default :users, :user_type, from: nil, to: "client"
  end
end
