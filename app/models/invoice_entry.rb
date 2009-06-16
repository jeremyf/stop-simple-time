class InvoiceEntry < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :entry
end
