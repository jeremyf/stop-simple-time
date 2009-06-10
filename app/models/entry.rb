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
  
  def self.hours_spent
    sum('hours_spent')
  end
  
  def self.amount_to_invoice
    calculate('sum', "#{quoted_table_name}.hours_spent * #{Project.quoted_table_name}.hourly_rate", :joins => :project)
  end
  
  def to_s; description; end
  delegate :hourly_rate, :to => :project
  def amount_to_invoice; hours_spent * hourly_rate; end
  def after_initialize; self.spent_on ||= Date.today; end
end
