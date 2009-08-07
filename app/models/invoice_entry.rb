# == Schema Information
# Schema version: 20090731015118
#
# Table name: invoice_entries
#
#  id         :integer         not null, primary key
#  invoice_id :integer
#  entry_id   :integer
#  paid       :boolean
#  created_at :datetime
#  updated_at :datetime
#

class InvoiceEntry < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :entry
end
