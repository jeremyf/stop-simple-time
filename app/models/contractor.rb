class Contractor < ActiveRecord::Base
  has_many :projects
  validates_presence_of :first_name, :last_name, :email, :phone, :address_line_1, :city, :state, :zip_code
  
  def to_s; "#{first_name} #{last_name}"; end
end
