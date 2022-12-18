class UpdateUserTypeToUsers < ActiveRecord::Migration[6.0]
  def up
    User.update_all(user_type: 'client')
  end

  def down
    User.update_all(user_type: nil)
  end
end
