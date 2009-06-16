class CreateInvoiceEntries < ActiveRecord::Migration
  def self.up
    create_table :invoice_entries do |t|
      t.integer :invoice_id
      t.integer :entry_id
      t.boolean :paid

      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_entries
  end
end
