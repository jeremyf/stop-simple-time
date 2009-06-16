class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @invoices }
    end
  end

  def show
    @invoice = Invoice.find(params[:id], :include => {:invoice_entries => :entry})

    respond_to do |format|
      format.html
      format.xml  { render :xml => @invoice }
      format.pdf  { prawnto :prawn => {}, :inline => true }
    end
  end

  def new
    @invoice = Invoice.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @invoice }
    end
  end

  def edit
    @invoice = Invoice.find(params[:id], :include => {:invoice_entries => :entry})
  end

  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        flash[:notice] = 'Invoice was successfully created.'
        format.html { redirect_to(@invoice) }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        flash[:notice] = 'Invoice was successfully updated.'
        format.html { redirect_to(@invoice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to(invoices_url) }
      format.xml  { head :ok }
    end
  end
end
