class RemovePublicationIdFromPublications < ActiveRecord::Migration[6.0]
  def change
    remove_column :publications, :publication_id, :integer
  end
end
