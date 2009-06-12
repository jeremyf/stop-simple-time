# == Schema Information
# Schema version: 20090605010700
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  client_id   :integer
#  name        :string(255)
#  hourly_rate :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :contractor
  has_many :entries, :order => "#{Entry.quoted_table_name}.spent_on DESC, #{Entry.quoted_table_name}.description ASC"
  validates_numericality_of :hourly_rate
  validates_presence_of :client_id, :name, :contractor_id
  
  delegate :address_lines, :to => :client
  
  def self.for_select
    find(:all, :include => :client).collect{|p| [p.to_s, p[:id]]}
  end
  
  def to_s; "#{client}: #{name}"; end
end
