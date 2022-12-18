class AddClientUserToReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :review_author_name
    add_reference :reviews, :client_user, null: false, foreign_key: true
  end
end
