# == Schema Information
# Schema version: 20090731015118
#
# Table name: invoices
#
#  id                 :integer         not null, primary key
#  project_id         :integer
#  invoice_as_of_date :date
#  created_at         :datetime
#  updated_at         :datetime
#

class Invoice < ActiveRecord::Base
  named_scope :unpaid, {
    :conditions => "#{quoted_table_name}.id NOT IN (SELECT invoice_id FROM #{Payment.quoted_table_name})"
  }
  belongs_to :project
  has_many :invoice_entries, :dependent => :destroy
  has_many :entries, :through => :invoice_entries
  has_one :payment
  validates_presence_of :project_id, :invoice_as_of_date


  delegate :contractor, :address_lines, :to => :project
  delegate :amount_to_invoice, :to => :entries
  delegate :hours_spent, :to => :entries

  after_create :auto_assign_entries

  def self.for_select(invoice = nil)
    returning(find(:all).collect{|p| [p.to_s, p[:id]]}) do |value|
      if invoice
        value << [invoice.to_s, invoice[:id]]
      end
    end
  end

  def to_s
    "Invoice ##{self[:id]} - #{project}"
  end

  protected
  def auto_assign_entries
    project.entries.not_invoiced.recorded_on_or_before(invoice_as_of_date).each do |entry|
      invoice_entries.create(:entry => entry)
    end
  end
end
