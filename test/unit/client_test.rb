require File.dirname(__FILE__) + '/../test_helper'

class ClientTest < ActiveSupport::TestCase
  should_have_db_column :name
  should_validate_presence_of :name
  should_have_many :projects
  should_have_many :entries
end
