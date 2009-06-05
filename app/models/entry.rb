# == Schema Information
# Schema version: 20090605010700
#
# Table name: entries
#
#  id          :integer         not null, primary key
#  description :string(255)
#  spent_on    :date
#  hours_spent :float
#  created_at  :datetime
#  updated_at  :datetime
#  project_id  :integer
#

class Entry < ActiveRecord::Base
  default_scope :order => "#{quoted_table_name}.spent_on DESC, #{quoted_table_name}.description ASC"
  belongs_to :project
  
  validates_presence_of :project_id, :description, :spent_on, :hours_spent
  validates_numericality_of :hours_spent
  
  def to_s; description; end
  delegate :hourly_rate, :to => :project
  def amount_invoiced; hours_spent * hourly_rate; end
end
