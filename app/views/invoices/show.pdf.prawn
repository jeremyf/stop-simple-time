pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 50] do
  pdf.stroke_horizontal_rule
  pdf.move_down(2)
  pdf.text("email: #{@project.contractor.email}; phone: #{@project.contractor.phone}")
  pdf.text("#{@project.contractor.first_name} #{@project.contractor.last_name}; #{@project.contractor.address_line_1}; #{@project.contractor.city}, #{@project.contractor.state} #{@project.contractor.zip_code}")
end


pdf.bounding_box([pdf.bounds.left, pdf.bounds.top - 60 ], :width  => pdf.bounds.width, :height => pdf.bounds.height - 120) do
  pdf.pad(5) do
    pdf.pad(5) do
      pdf.bounding_box([pdf.bounds.left, pdf.cursor], :width => pdf.bounds.width) do
        pdf.text("<strong>Invoice #1</strong>", :size => 20)
        pdf.move_up(pdf.font_size)
        pdf.text("<strong>Invoice Date: #{Date.today.to_s}</strong>", :size => 11, :align => :right)
      end
    end
    pdf.stroke_line([(pdf.bounds.left), (pdf.cursor)], [(pdf.bounds.right),(pdf.cursor)])
  end
  
  pdf.pad(5) do
    pdf.text("<strong>Sold To</strong>", :size => 11)
    @project.address_lines.each do |line|
      pdf.text(line, :size => 11)
    end
    pdf.stroke_line([(pdf.bounds.left), (pdf.cursor)], [(pdf.bounds.right),(pdf.cursor)])
  end
  pdf.pad(5) do
    pdf.table(
      @entries.group_by(&:spent_on).inject([]) { |mem, (spent_on, spent_on_entries)|
        spent_on_entries.group_by(&:hourly_rate).each { |hourly_rate, entries|
          mem << [spent_on, entries.to_sentence, number_with_precision(entries.sum(&:hours_spent), :precision => 2), number_to_currency(entries.sum(&:amount_to_invoice))]
        }
        mem;
      }, :headers => ['<strong>Date</strong>', '<strong>Notes</strong>', '<strong>Hours</strong>', '<strong>Amount</strong>'],
      :align => {0 => :left, 1 => :left, 2 => :right, 3 => :right},
      :align_headers => {0 => :left, 1 => :left, 2 => :right, 3 => :right}
    )
    pdf.move_down(20)
    pdf.text("Total Hours: #{number_with_precision(@entries.inject(0) {|m,v| m+= v.hours_spent}, :precision => 2)}", :size => 15)
    pdf.text("Amount Due: #{number_to_currency(@entries.inject(0) {|m,v| m += v.amount_to_invoice})}", :size => 15)
    
    pdf.move_down(40)
    pdf.text("Make all checks payable to: Jeremy Friesen")
  end
end
