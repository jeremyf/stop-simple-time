class Client < ActiveRecord::Base
  validates_presence_of :name
  has_many :entries
  def to_s; name; end
  
  def address_lines
    [name, '2116 W. Wilden Ave. Suite C', 'Goshen, IN, 46526']
  end
end
