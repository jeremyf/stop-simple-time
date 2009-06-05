require File.dirname(__FILE__) + '/../test_helper'

class EntryTest < ActiveSupport::TestCase
  should_have_db_column :description
  should_have_db_column :spent_on
  should_have_db_column :hours_spent
  
  should_belong_to :client
  
  should_validate_presence_of :client_id
end
