#!/usr/bin/env /Users/jeremyf/Documents/Repositories/git/stop-simple-time/script/runner

puts "Invoice Amount: $#{Entry.not_invoiced.amount_to_invoice}"
puts "Unpaid Amount:  $#{Entry.not_paid.amount_to_invoice}"

puts "Hours Histogram:"
Entry.find(:all).group_by {|a| a.spent_on.strftime('%Y-%m')}.inject({}) {|m, (month, coll)| m[month] = coll.sum(&:hours_spent); m}.each do |time, hours|
  puts "\t#{time}:\t#{hours}"
end