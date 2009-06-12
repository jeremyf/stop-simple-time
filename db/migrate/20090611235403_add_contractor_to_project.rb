class AddContractorToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :contractor_id, :integer
    add_index :projects, :contractor_id
  end

  def self.down
    remove_column :table_name, :column_name
  end
end
