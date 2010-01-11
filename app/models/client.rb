# == Schema Information
# Schema version: 20090605010700
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Client < ActiveRecord::Base
  validates_presence_of :name
  has_many :projects
  has_many :entries, :through => :project
  
  def to_s; name; end
  
  def address_lines
    [name, '118 S. Main St., Ste. 3', 'Goshen, IN, 46526']
  end
end
