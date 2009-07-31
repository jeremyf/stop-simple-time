Factory.define :entry do |entry|
  entry.description 'MyString'
  entry.spent_on '2009-06-03'
  entry.hours_spent '1.5'
  entry.project_id { (Project.find(:first) || Factory(:project))[:id] }
end
