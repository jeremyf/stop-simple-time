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
  has_many :invoice_entry, :foreign_key => 'entry_id', :dependent => :destroy
  has_many :invoices, :through => :invoice_items
  
  validates_presence_of :project_id, :description, :spent_on, :hours_spent
  validates_numericality_of :hours_spent
  
  named_scope :not_invoiced, {
    :select => "DISTINCT #{quoted_table_name}.*",
    :joins => "LEFT OUTER JOIN #{InvoiceEntry.quoted_table_name} not_invoiced_invoice_entry ON not_invoiced_invoice_entry.entry_id = #{quoted_table_name}.id",
    :conditions => "not_invoiced_invoice_entry.entry_id IS NULL"
  }
  
  named_scope :not_paid, {
    :select => "DISTINCT #{quoted_table_name}.*",
    :joins => "LEFT OUTER JOIN #{InvoiceEntry.quoted_table_name} not_invoiced_invoice_entry ON not_invoiced_invoice_entry.entry_id = #{quoted_table_name}.id
    LEFT OUTER JOIN #{Payment.quoted_table_name} not_paid_payments ON not_paid_payments.invoice_id = not_invoiced_invoice_entry.invoice_id
    ",
    :conditions => "not_invoiced_invoice_entry.entry_id IS NULL OR not_paid_payments.invoice_id IS NULL"    
  }


  named_scope :recorded_on_or_before, lambda {|as_of_date|
    # Converting as_of_date to tomorrow, so we can guarantee that any entries from today are included
    {:conditions => ["#{quoted_table_name}.spent_on <= ?", as_of_date.end_of_day]}
  }
  
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
  def <=>(other)
    spent_on <=> other.spent_on
  end
end
