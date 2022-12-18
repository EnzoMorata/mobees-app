class RemoveThumbnailFromPublication < ActiveRecord::Migration[6.0]
  def change
    remove_column :publications, :thumbnail, :string
  end
end
