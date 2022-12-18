class CreateFavoriteOfs < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_ofs do |t|
      t.integer :publication_id
      t.string :client_name

      t.timestamps
    end
  end
end
