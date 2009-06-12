class CreateContractors < ActiveRecord::Migration
  def self.up
    create_table :contractors do |t|
      t.string :email
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end

  def self.down
    drop_table :contractors
  end
end
