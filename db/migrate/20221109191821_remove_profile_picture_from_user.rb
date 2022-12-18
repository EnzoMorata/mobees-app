class RemoveProfilePictureFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :profile_picture, :string
  end
end
