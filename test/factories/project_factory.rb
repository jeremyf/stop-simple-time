Factory.define :project do |project|
  project.association :client
  project.association :contractor
  project.name 'MyString'
  project.hourly_rate 55.0
end
