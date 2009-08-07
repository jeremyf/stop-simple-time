require File.dirname(__FILE__) + '/../test_helper'

class EntryTest < ActiveSupport::TestCase
  should_have_db_column :description
  should_have_db_column :spent_on
  should_have_db_column :hours_spent
  should_have_db_column :project_id
  
  should_belong_to :project

  should_have_many :invoice_entry, :dependent => :destroy
  should_have_many :invoices
  
  
  should_validate_presence_of :project_id
  
  should 'have named scope for recorded_on_or_before' do
    @today = Date.today
    assert_difference 'Entry.recorded_on_or_before(@today).count', 1 do
      Factory.create(:entry, :spent_on => @today)
      Factory.create(:entry, :spent_on => 1.day.from_now)
    end
  end

  should 'have named scope for not_invoiced' do
    @today = Date.today
    assert_difference 'Entry.not_invoiced.length', 1 do
      entry = Factory.create(:entry)
      Factory.create(:invoice_entry, :entry => entry)

      entry = Factory.create(:entry)      
    end
  end

  should 'have named scope for not_paid' do
    @today = Date.today
    assert_difference 'Entry.not_paid.length', 1 do
      entry = Factory.create(:entry)
      Factory.create(:invoice_entry, :entry => entry)
    end

    assert_difference 'Entry.not_paid.length', 0 do
      entry = Factory.create(:entry)
      # Invoice
      invoice_entry = Factory.create(:invoice_entry, :entry => entry)
      # Pay it
      Factory.create(:payment, :invoice => invoice_entry.invoice)
    end
  end
end
