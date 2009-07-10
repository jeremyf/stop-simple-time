class Invoice < ActiveRecord::Base
  belongs_to :project
  has_many :invoice_entries, :dependent => :destroy
  has_many :entries, :through => :invoice_entries
  validates_presence_of :project_id, :invoice_as_of_date
  
  
  delegate :contractor, :address_lines, :to => :project
  delegate :amount_to_invoice, :to => :entries
  
  
  after_create :auto_assign_entries
  
  protected
  def auto_assign_entries
    project.entries.not_invoiced.recorded_on_or_before(invoice_as_of_date).each do |entry|
      invoice_entries.create(:entry => entry)
    end
  end
end
