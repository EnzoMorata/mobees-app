class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :publication_id
      t.string :review_author_name
      t.integer :review_id
      t.float :rating
      t.text :content

      t.timestamps
    end
  end
end
