class AddClientToEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :client_id, :integer
    add_index :entries, :client_id
  end

  def self.down
    remove_column :entries, :client_id
  end
end
