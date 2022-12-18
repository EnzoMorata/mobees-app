class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :issuing_name
      t.string :receiver_name
      t.timestamp :date
      t.text :content

      t.timestamps
    end
  end
end
