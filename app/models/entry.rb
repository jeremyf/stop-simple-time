# == Schema Information
# Schema version: 20090604005305
#
# Table name: entries
#
#  id          :integer         not null, primary key
#  description :string(255)
#  spent_on    :date
#  hours_spent :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Entry < ActiveRecord::Base
  default_scope :order => "#{quoted_table_name}.spent_on ASC, #{quoted_table_name}.description ASC"
  belongs_to :client
  
  validates_presence_of :client_id
  
  def to_s; description; end
end
