require File.dirname(__FILE__) + '/../test_helper'

class ContractorTest < ActiveSupport::TestCase
  should_have_db_column :email
  should_have_db_column :phone
  should_have_db_column :first_name
  should_have_db_column :last_name
  should_have_db_column :address_line_1
  should_have_db_column :city
  should_have_db_column :state
  should_have_db_column :zip_code
end
