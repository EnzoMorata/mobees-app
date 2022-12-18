class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.integer :publication_id
      t.string :review_author_name
      t.integer :review_id
      t.integer :previous_comment_id
      t.integer :response_comment_id

      t.timestamps
    end
  end
end
