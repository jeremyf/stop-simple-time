require File.dirname(__FILE__) + '/../test_helper'

class InvoiceTest < ActiveSupport::TestCase
  should_have_db_column :project_id
  should_have_db_column :invoice_as_of_date
  
  should_belong_to :project
  should_have_many :invoice_entries, :dependent => :destroy
  should_have_many :entries
  
  
  should 'auto assign entries' do
    project = Factory(:project)
    later_entry = Factory(:entry, :spent_on => 1.day.from_now, :project => project)
    previous_entry = Factory(:entry, :spent_on => 1.day.ago, :project => project)
    
    invoice = Factory(:invoice, :project => project, :invoice_as_of_date => Date.today)
    
    assert invoice.entries.include?(previous_entry)
    assert ! invoice.entries.include?(later_entry)
  end
end
