class RemoveUsersFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :users, null: false, foreign_key: true
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end
