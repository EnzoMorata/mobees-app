class AddPublicationToReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :publication_id
    add_reference :reviews, :publication, null: false, foreign_key: true
  end
end
