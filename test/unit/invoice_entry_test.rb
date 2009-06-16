require File.dirname(__FILE__) + '/../test_helper'

class InvoiceEntryTest < ActiveSupport::TestCase
  should_have_db_column :invoice_id
  should_have_db_column :entry_id
  should_have_db_column :paid
end
