# == Schema Information
# Schema version: 20090731015118
#
# Table name: payments
#
#  id                  :integer         not null, primary key
#  invoice_id          :integer
#  payment_amount      :float
#  check_number        :integer
#  payment_received_on :date
#  created_at          :datetime
#  updated_at          :datetime
#

class Payment < ActiveRecord::Base
  belongs_to :invoice
  validates_presence_of :invoice_id, :payment_amount, :check_number, :payment_received_on
end
