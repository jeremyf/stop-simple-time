#!/usr/bin/env /Users/jeremyf/Documents/Repositories/git/stop-simple-time/script/runner

puts "Paid Amount:    $#{Entry.this_year.amount_to_invoice}"
puts "Invoice Amount: $#{Entry.this_year.not_invoiced.amount_to_invoice}"
puts "Unpaid Amount:  $#{Entry.this_year.not_paid.amount_to_invoice}"

puts "Hours Histogram:"
Entry.this_year.find(:all).group_by {|a| a.spent_on.beginning_of_week.strftime('%Y-%m-%d')}.inject({}) {|m, (month, coll)| m[month] = coll.sum(&:hours_spent); m}.sort{|a,b| a[0] <=> b[0]}.each do |time, hours|
  puts "\t#{time}:\t#{hours}"
end