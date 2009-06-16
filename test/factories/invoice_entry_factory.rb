Factory.define :invoice_entry do |invoice_entry|
  invoice_entry.association :invoice
  invoice_entry.association :entry
  invoice_entry.paid false
end
