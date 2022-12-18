class RemoveContentFromPublication < ActiveRecord::Migration[6.0]
  def change
    remove_column :publications, :content, :string
  end
end
