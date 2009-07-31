class Payment < ActiveRecord::Base
  belongs_to :invoice
  validates_presence_of :invoice_id, :payment_amount, :check_number, :payment_received_on
end
