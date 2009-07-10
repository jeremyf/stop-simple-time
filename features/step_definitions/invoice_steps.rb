Given /^the following entries:$/ do |entries|
  entries.hashes.each do |entry_attributes|
    Factory(:entry, entry_attributes)
  end
end

Given /^the following invoices:$/ do |invoices|
  Invoice.create!(invoices.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) invoice$/ do |pos|
  visit invoices_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /the new invoice should have (\d+) entries$/ do |result|
  Invoice.find(:last).entries.count == result.to_i
end

Then /^I should see the following invoices:$/ do |invoices|
  invoices.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end
