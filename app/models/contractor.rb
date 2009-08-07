# == Schema Information
# Schema version: 20090731015118
#
# Table name: contractors
#
#  id             :integer         not null, primary key
#  email          :string(255)
#  phone          :string(255)
#  first_name     :string(255)
#  last_name      :string(255)
#  address_line_1 :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip_code       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Contractor < ActiveRecord::Base
  has_many :projects
  validates_presence_of :first_name, :last_name, :email, :phone, :address_line_1, :city, :state, :zip_code
  
  def to_s; "#{first_name} #{last_name}"; end
end
