require File.dirname(__FILE__) + '/../test_helper'

class PaymentTest < ActiveSupport::TestCase
  should_have_db_column :invoice_id
  should_have_db_column :payment_amount
  should_have_db_column :check_number
  should_have_db_column :payment_received_on
end
