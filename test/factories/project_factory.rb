Factory.define :project do |project|
  project.client_id { (Client.find(:first) || Factory(:client))[:id]}
  project.contractor_id { (Contractor.find(:first) || Factory(:contractor))[:id]}
  project.name 'MyString'
  project.hourly_rate 55.0
end
