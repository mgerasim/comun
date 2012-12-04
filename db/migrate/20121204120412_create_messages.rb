class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :client
      t.string :text

      t.timestamps
    end
    add_index :messages, :client_id
  end
end
