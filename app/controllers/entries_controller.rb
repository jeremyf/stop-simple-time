class EntriesController < ApplicationController
  def index
    @entries = Entry.find(:all, :include => {:project => :client})

    respond_to do |format|
      format.html
      format.xml  { render :xml => @entries.to_xml(:methods => [:amount_to_invoice], :include => {:project => {:include => :client}}) }
      format.csv  
    end
  end

  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @entry }
    end
  end

  def new
    @entry = Entry.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @entry }
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        flash[:notice] = 'Entry was successfully created.'
        format.html { redirect_to(entries_path) }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        flash[:notice] = 'Entry was successfully updated.'
        format.html { redirect_to(entries_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end
end
