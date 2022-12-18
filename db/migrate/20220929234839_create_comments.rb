class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :publication_id
      t.string :review_author_name
      t.integer :review_id
      t.string :comment_author_name
      t.integer :comment_id
      t.text :content

      t.timestamps
    end
  end
end
