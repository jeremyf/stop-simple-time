Factory.define :invoice do |invoice|
  invoice.association :project
  invoice.invoice_as_of_date Date.today
end
