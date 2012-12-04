class CreateClientsGroups < ActiveRecord::Migration
  def change
    create_table :clients_groups do |t|
      t.references :client
      t.references :group

    end
    add_index :clients_groups, :client_id
    add_index :clients_groups, :group_id
  end
end
