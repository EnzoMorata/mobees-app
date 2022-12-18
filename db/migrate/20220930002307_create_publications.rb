class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.integer :publication_id
      t.string :title
      t.text :synopsis
      t.string :content
      t.string :thumbnail

      t.timestamps
    end
  end
end
