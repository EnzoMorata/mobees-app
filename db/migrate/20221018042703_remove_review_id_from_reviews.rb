class RemoveReviewIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :review_id, :integer
  end
end
