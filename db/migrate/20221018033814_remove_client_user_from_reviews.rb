class RemoveClientUserFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :client_user, null: false, foreign_key: true
    add_reference :reviews, :users, index: true, foreign_key: true
  end
end
