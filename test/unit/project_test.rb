require File.dirname(__FILE__) + '/../test_helper'

class ProjectTest < ActiveSupport::TestCase
  should_have_db_column :client_id
  should_have_db_column :name
  should_have_db_column :hourly_rate
  
  should_validate_presence_of :client_id, :name
end
