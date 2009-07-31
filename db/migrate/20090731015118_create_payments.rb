class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :invoice_id
      t.float :payment_amount
      t.integer :check_number
      t.date :payment_received_on

      t.timestamps
    end
    add_index :payments, :invoice_id
  end

  def self.down
    drop_table :payments
  end
end
