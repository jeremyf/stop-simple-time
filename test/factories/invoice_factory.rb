Factory.define :invoice do |invoice|
  invoice.project_id { (Project.find(:first) || Factory(:project))[:id] }
  invoice.invoice_as_of_date Date.today
end
